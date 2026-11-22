<?php

    require_once("Ghosts.php");
    $ghosts = new Ghosts();

    $type = $ghosts->query("types", "ghost");
?>

<script type="text/javascript">
    $( document ).ready(function() {
        var getForces = function()
        {
            var target = $("#type").get(0);
            $.ajax({ type: "POST", url: "data/optforces.php?id="+target.value })
                .done(function (msg) {
                    var forces = JSON.parse(msg);
                    var shippi = $('#optionalForces');

                    shippi.empty();
                    $(forces).each(function(index, element)
                    {
                        var optionBox = $('<div><label class="checkbox-inline"> <input type="checkbox" id="inlineCheckbox'+index+'" value="'+element['id']+'">' +
                            element['forcename']+'</label><button type="button" style="margin-left:15px;" class="btn btn-info glyphicon glyphicon-question-sign"></button></div>');
                        optionBox.find('button').popover({
                            'placement' : 'right',
                            'trigger' : 'click',
                            'title' : element['forcename'],
                            'content' : element['description']
                        });

                        shippi.append(optionBox);
                    });
                    shippi.insertBefore($('#forcesbypowerwarning'));
                });
        }
        var checkForceCount = function()
        {
            var checkedCount = 0;
            $('#optionalForces input[type=checkbox]').each(function(ind, inp)
            {
                if(inp.checked) checkedCount++;

            });
            var allowedForces = Math.floor(parseInt($('#power').get(0).value)/3);
            if(checkedCount > allowedForces)
            {
                var warning = $($('#forcesbypowerwarning').get(0));
                warning.find('span').text(allowedForces);
                warning.show(200).delay(5000).hide(500);
                return false;
            }

            return true;
        }

        getForces();
        $("#type").change(function(e) {
            getForces();
        });


        $("#summon").click(function(e)
        {
            e.preventDefault(); //STOP default action
            if(!checkForceCount()) return;

            var ghosttype = parseInt($('#type').get(0).value);
            var power = parseInt($('#power').get(0).value);
            var services = parseInt($('#services').get(0).value);
            var optionalforces = [];
            $(this).find("input[type=checkbox]").each(function(){
                var el = $(this).get(0);
                if(el.checked) {
                    optionalforces.push(el.value);
                }
            })

            $.ajax({url : "data/add.php?type="+ghosttype+"&power="+power+"&services="+services+"&forces="+optionalforces.join()+"&owner="+$('#users').get(0).value})
                .done(function (msg) {
                    location.reload();
                });

        });

    });


</script>
<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">Ghost !</h4></div>
<div class="modal-body">
<form class="form-horizontal" role="form" id="createform">

    <div class="form-group">
        <label  class="col-sm-2 control-label" for="power">Typ</label>
        <div class="col-sm-10">
            <select class="form-control" id="type">
                <?php foreach($type as $ghosttype) : ?>
                    <option value="<?php echo $ghosttype['id']; ?>"><?php echo $ghosttype['name']; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="power">Kraftstufe</label>
        <div class="col-sm-10">
            <select class="form-control" id="power">
                <?php for($i=1; $i <= 10; $i++) : ?>
                    <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                <?php endfor; ?>
            </select>
         </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="forces">Dienste</label>
        <div class="col-sm-10">
            <select class="form-control" id="services">
                <?php for($i=1; $i <= 10; $i++) : ?>
                    <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                <?php endfor; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="forces">Dienste</label>
        <div class="col-sm-10">
            <div id="optionalForces"> -- <div>
        </div>


    </div>
    <div id="forcesbypowerwarning" class="alert alert-danger" style="display:none; margin-top:15px;">Du kannst bei dieser Kraftstufe nur maximal <span id="allowedforces"></span> Kräfte auswählen !</div>

    <div style="float:right;">
        <button type="button" id="summon" class="btn btn-primary glyphicon glyphicon-plane">  Herbeirufen</button>
        <div style="clear: both"></div>
    </div>
</form>
</div>