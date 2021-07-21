<?php
include_once './DB/info.php';
include_once './layout/header.php'
?>
<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-4">
  <a href="/delivery">Delivery</a>

            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom ">
                <h1 class="h2">Dashboard</h1>
            </div>




            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center p-1 ">
                <h5 class="h5">Deliveries</h5>
            </div>
            <?php if (isset($_SESSION["message"])) { ?>
                <p class="alert <?php echo $_SESSION["type"] ?>"><?php echo  $_SESSION["message"] ?></p>
            <?php }

            session_destroy();
            ?>


            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center p-1 float-right mr-5 mb-3">
                <a href="<?php echo $base_path.'create.php'?>" class="btn btn-primary btn-rounded float-right ">Create</a>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table border="0" cellspacing="5" cellpadding="5">
                        <tbody>
                        <tr>
                            <td>Minimum Date:</td>
                            <td><input name="min" id="min" type="text"></td>
                        </tr>
                        <tr>
                            <td>Maximum Date:</td>
                            <td><input name="max" id="max" type="text"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-striped" id="laravel_datatable">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Company Name</th>
                        <th>File</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                    </thead>

                </table>
            </div>
        </main>

</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js "></script>

<script>
    var SITEURL = '<?php echo $base_path  ?>'+'Classes/main.php';
    $(document).ready( function () {

        var ajaxSetup = function() {
            headers: {
            }
        }



        var table =  $('#laravel_datatable').DataTable( {
            "bProcessing": true,
            "bServerSide": true,
            ajax: {
                url: SITEURL,
                type: 'GET',
                "data": function ( d ) {
                    d.mindate = $('#min').datepicker({ dateFormat: 'yy-mm-dd' }).val();
                    d.maxdate = $('#max').datepicker({ dateFormat: 'yy-mm-dd' }).val();
                }
            },

            columns: [
                {data: 'id', name: 'id', 'visible': false},
                {data: 'start_date', name: 'start_date'},
                {data: 'end_date', name: 'end_date'},
                {data: 'courier_name', name: 'courier_name'},
                {data: 'file', name: 'file'},
                {data: 'updated_at', name: 'updated_at'},
                {data: 'action', name: 'action'},
            ],
            order: [[0, 'desc']],
            initComplete: function () {

                var column = this;
                var select = $('<div class="my-2">' +
                    '<lable for="select_filter">Company: ' +
                    '<select id="select_filter" >' +
                    '<option value="">All</option>' +
                    '<option value="Royal Mail">Royal Mail</option>' +
                    '<option value="DHL">DHL</option>' +
                    '<option value="ParcelForce">ParcelForce</option>' +
                    '<option value="DPD">DPD</option>' +
                    '</select>' +
                    '</lable>'+
                    '</div>')
                    .appendTo( $('#laravel_datatable_filter'))
                    .on('change', function () {
                        var val = $('#select_filter').val();
                        $('#laravel_datatable').dataTable().fnFilter(val);
                    } );



            }
        } );






        $.fn.dataTable.ext.search.push();
        $("#min").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
        $("#max").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });


        // Event listener to the two range filtering inputs to redraw on input
        $('#min, #max').change(function () {
            table.draw();
        });
    });

</script>
<script>
    setTimeout(function () {
        $(".alert").fadeTo(2000, 500).slideUp(500, function(){
            $(".alert").slideUp(500);
        });
    },1000)
</script>
</body>
</html>
