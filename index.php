<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>i can see ghosts ...</title>

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css">

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="jquery.cookie.js"></script>

    <style>
        .modal .btn {
            padding: 2px 8px;
        }
        table.centered tr td, table.centered tr th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        $( document ).ready(function() {
            var loadGhostsOfSelectedOwner = function()
            {
                $.ajax({
                    type: "POST",
                    url: "data/test.php?target=ghosts&of=owner&id="+$('#users').get(0).value
                })
                    .done(function (msg) {
                        $("#ghosttable tbody").empty();
                        var obj = ( jQuery.parseJSON(msg) );
                        $.each(obj, function (index, value) {
                            var tr = document.createElement("tr");
                            tr.id = "GHOST_" + value.id;

                            $("#ghosttable tbody").get(0).appendChild(tr);
                            var td = document.createElement("td");
                            var html = '<span class="glyphicon glyphicon-'+value["icon"]+'">  '+value["typename"]+'</span>';
                            $(td).html(html);
                            $(tr).append(td);

                            $.each(["power", "services", "bound"], function (index, field) {
                                var td = document.createElement("td");
                                $(td).addClass("type_"+field);
                                if(field=='power')
                                {
                                    var html = '<div class="progress">'+
                                        '<div class="progress-bar progress-bar-info" role="progressbar" '+
                                        ' aria-valuenow="'+value[field]+'" aria-valuemin="0" aria-valuemax="10" style="width: '+value[field]+'0%">'+
                                        '<span class="">'+value[field]+'</span>'+' </div> </div>';
                                    $(td).html(html);

                                } else {
                                    $(td).text((value[field] != null)?value[field]:"");
                                }
                                $(tr).append(td);
                            });
                            var td = document.createElement("td");
                            $(td).addClass("type_details");

                            var modal = document.createElement("button");
                            modal.type = "button";
                            $(modal).addClass("btn btn-default glyphicon glyphicon-list-alt")

                            $(td).append(modal);

                            $(modal)
                                .click(function() {
                                    var ship = $('<div class="modal fade bs-modal-lg" tabindex="-1" role="dialog"><div class="modal-dialog modal-lg">' +
                                        '<div class="modal-content">' +
                                        '</div></div></div>');
                                    $(ship).modal( {
                                        "show" : true,
                                        "target": "#ggg",
                                        "remote" : "data/details.php?id="+value["id"]
                                    });
                                    $(ship).on('hidden.bs.modal', function (e) {
                                        console.log(e);
                                        $('div.modal').remove();
                                    });
                                })


                            var modal = document.createElement("button");
                            modal.type = "button";
                            $(modal).addClass("btn btn-danger glyphicon glyphicon-remove-circle")

                            $(td).append(modal);

                            $(modal).click(function() {
                                $.ajax({url : "data/delete.php?id="+value["id"]})
                                    .done(function () {
                                        $('#GHOST_'+value["id"]).remove();
                                    });
                            });


                            $(tr).append(td);
                        });
                    });
            }


            $('#addaghost').click(function(e)
            {
                var eee = $('<div class="modal fade bs-modal-lg" tabindex="-1" role="dialog"><div class="modal-dialog modal-lg">' +
                    '<div class="modal-content">' +
                    '</div></div>' +
                    '</div>');
                $(eee).modal( {
                    "show" : true,
                    "target": ".modal-body",
                    "remote" : "data/create.php"
                });
            });


            $.ajax({
                type: "POST",
                url: "data/user.php"
            }).done(function(msg)
            {
                $('#users').empty();
                var obj = ( jQuery.parseJSON(msg) );
                $.each(obj, function (index, value) {
                    var option = $('<option value ="'+value['id']+'">'+value['name']+'</option>');
                    $('#users').append(option);
                });
                $('#users').val($.cookie('user'));
                loadGhostsOfSelectedOwner();
            });

            $('#users').change(function(e){
                $.cookie('user', $('#users').get(0).value);
                loadGhostsOfSelectedOwner();
            });


        });
    </script>
</head>
<body>



<div style="position: relative;
padding: 15px;
margin: 0 -15px 15px;
margin-left: 0;
margin-right: 0;
background-color: #fff;
border-width: 1px;
border-color: #ddd;
border-radius: 4px 4px 0 0;
box-shadow: none;">
    <div class="well well-lg"><h1>Shadowrun 4.0 Ghostmanager</h1></div>

    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="eingabefeldEmail3" class="col-sm-1 control-label">Benutzer</label>
            <div class="col-sm-11">
                <select class="form-control" id="users"></select>
            </div>
        </div>
    </form>


    <table class="table table-striped table-hover" id="ghosttable">
        <thead>
        <tr>
            <th>Typ</th>
            <th>Kraftstufe</th>
            <th>Dienste</th>
            <th>gebunden</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>


    <button type="button" id="addaghost" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span>  add ghost</button>
</div>


<div class="modal fade bs-modal-lg" id="4" tabindex="-1" role="dialog" aria-labelledby="meinGroßesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            ...
        </div>
    </div>
</div>

</body>
</html>