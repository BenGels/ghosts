<?php

    require_once("Ghosts.php");
    $ghosts = new Ghosts();
    $id = $_GET['id'];

    $basic = $ghosts->query("BASE", "GHOST", $id)[0];
    $optForces = $ghosts->query("OPTIONALFORCES","GHOST",$id);
    $forces = $ghosts->query("FORCES","GHOST",$id);
    $skills = $ghosts->query("SKILLS","GHOST",$id);
    $attributeMods = $ghosts->query("ATTRIBUTE","GHOST",$id);
    $allAttributes = $ghosts->query("TYPES", "ATTRIBUTES");
    $damage = $ghosts->getDamage($id);

    $orderedAttributes = array();
    foreach($allAttributes as $a)
    {
        $orderedAttributes[$a['id']] = $a['name'];
    }

    $orderedAttributeMods = array();

    foreach($attributeMods as $am)
    {
        $orderedAttributeMods[$am['id']] = intval($am['mod']);
    }

    $power = intval($basic['power']);
    $forces = array_merge($forces, $optForces);
?>

<script type="text/javascript">
    var ghostId = <?php echo $id; ?>;
    var services = <?php echo $basic["services"]?>;
    $( document ).ready(function() {
        $(".incServices").click(function() {
            changeServices(1);
        });
        $(".decServices").click(function() {
            changeServices(-1);
        });
        $(".incMonitorAstral").click(function(e) {
            changeDamage("astral", 1, e.target);
        });
        $(".decMonitorAstral").click(function(e) {
            changeDamage("astral", -1, e.target);
        });
        $(".incMonitorMundan").click(function(e) {
            changeDamage("mundan", 1, e.target);
        });
        $(".decMonitorMundan").click(function(e) {
            changeDamage("mundan", -1, e.target);
        });
        $('.boundcheck').click(function(e)
        {
            $.ajax({ type: "POST", url: "data/togglebound.php?id="+ghostId });
            $('#GHOST_'+ghostId+" td.type_bound").text((e.target.checked)?"Ja":"Nein");

        });
    });

    var changeDamage = function (type, value, target)
    {
        var target = $(target).parents("td").get(0);
        $.ajax({ type: "POST", url: "data/changeDamage.php?id="+ghostId+"&value="+value+"&type="+type })
            .done(function (msg) {
                $(target).find("span.curr").text(msg);

            });
    }
    var changeServices = function(value) {
        $.ajax({ type: "POST", url: "data/changeServices.php?id="+ghostId+"&value="+value })
            .done(function (msg) {
                $('#GHOST_'+ghostId+" td.type_services").text(msg);
                $('#GHOST_DETAIL_'+ghostId+" td.type_services span.servicesVal").text(msg);
            });
    }
</script>
<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">
        <?php echo $basic["name"]; ?> #<?php echo $basic["id"]; ?>
</h4></div>
<div id="ggg" class="modal-body">

<table class="table centered" id="GHOST_DETAIL_<?php echo $id ?>">
    <thead>
    <tr>
        <th>Typ</th>
        <th>Kraftstufe</th>
        <th>Dienste</th>
        <th>Gebunden</th>
        <th>Geschwindigkeit</th>
        <?php if($basic["weaknesses"]!=null) : ?><th>Schwäche</th><?php endif; ?>
        <th>Monitor astral</th>
        <th>Monitor mundan</th>

    </tr>
    </thead>
    <tbody>
        <td><?php echo $basic["name"]; ?></td>
        <td><?php echo $basic["power"]; ?></td>
        <td class="type_services"> <span class="servicesVal"><?php echo $basic["services"]; ?></span>
            <br>
            <button type="button" class="btn btn-primary btn-xs incServices"><span class="glyphicon glyphicon-plus-sign"></span></button>
            <button type="button" class="btn btn-primary btn-xs decServices"><span class="glyphicon glyphicon-minus-sign"></span></button>
        </td>
        <td><input type="checkbox" class="boundcheck" <?php if($basic["bound"]==1) echo "checked"; ?>></td>
        <td><?php echo $basic["movement_slow"]; ?> / <?php echo $basic["movement_fast"]; ?></td>

        <?php if($basic["weaknesses"]!=null) : ?> <td><?php echo $basic["weaknesses"]; ?></td> <?php endif; ?>
        <td>
            <span class="curr"><?php echo (isset($damage['astral']))?$damage['astral']:0; ?></span> /
            <span class="max"><?php echo (8 + ceil( ($power + $orderedAttributeMods[2])/2 )); ?></span>
            <br>
            <button type="button" class="btn btn-danger btn-xs incMonitorAstral"><span class="glyphicon glyphicon-plus-sign"></span></button>
            <button type="button" class="btn btn-success btn-xs decMonitorAstral"><span class="glyphicon glyphicon-minus-sign"></span></button>
        </td>
        <td>
            <span class="curr"><?php echo (isset($damage['mundan']))?$damage['mundan']:0; ?></span> /
            <span class="max"><?php echo ceil(8 + ( ($power + $orderedAttributeMods[8]) /2 )); ?></span>
            <br>
            <button type="button" class="btn btn-danger btn-xs incMonitorMundan"><span class="glyphicon glyphicon-plus-sign"></span></button>
            <button type="button" class="btn btn-success btn-xs decMonitorMundan"><span class="glyphicon glyphicon-minus-sign"></span></button>

        </td>

    </tbody>
</table>

<table class="table centered">
    <thead>
    <tr>
        <?php foreach($allAttributes as $attribute) : ?>
            <th><?php echo $attribute['short']; ?></th>
        <?php endforeach; ?>
        <th>ID (m/a)</th>
        <th>INI (m/a)</th>
    </tr>
    </thead>
    <tbody>
        <?php foreach($orderedAttributes as $id => $attribute) : ?>
            <td><?php
                    $v = $power + intval($orderedAttributeMods[$id]);
                    echo ($v>1)?$v:1; ?></td>
        <?php endforeach; ?>
        <td><?php echo "(2 / 3)"; ?></td>
        <td><?php echo "(". (($power*2) + intval($orderedAttributeMods[13])) . " / " . ($power*2).")"; ?></td>
    </tbody>
</table>

<table class="table table-responsive">
    <thead>
    <tr>
        <th width="50%">Kräfte</th>
        <th width="50%">Skills</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td width="50%">
            <div class="panel-group" id="accordion">
                <?php  foreach($forces as $force): ?>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $force["id"]?>">
                                    <?php if($force['optional'] == 1)
                                                echo "<span class=\"glyphicon glyphicon-star\"></span>&nbsp;".$force["forcename"]."";
                                          else
                                                echo $force["forcename"];
                                    ?>
                                </a>
                            </h4>
                        </div>
                        <div id="collapse<?php echo $force["id"]?>" class="panel-collapse collapse">
                            <div class="panel-body">
                                <?php echo $force["description"]?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </td>
        <td width="50%">
            <?php foreach($skills as $skill)
                echo $skill["skillname"] . " <i>(" . $skill["attributename"] . " / " . ( ($power*2) + intval($orderedAttributeMods[$skill["id"]]) ) . ")</i><br>";
            ?>
        </td>
    </tr>
    </tbody>
</table>
</div>
