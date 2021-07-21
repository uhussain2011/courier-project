<?php
include_once 'Classes/courierfunc.php';
include_once './layout/header.php';



$data = new View();

if(!isset($_GET['id']))
{
    header("Location:".$base_path);
}

$list= $data->GetData($_GET['id']);
$list = json_decode(json_encode($list));

$details = $data->GetDetails($_GET['id']);


?>
<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-4">
      <a href="/delivery">Delivery</a>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom ">
                <h1 class="h2">Dashboard</h1>
            </div>
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center p-1 ">
                <h5 class="h5">Consignment Details</h5>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-3">
                    <b>Start Date</b>:  <?php echo $list->start_date ?>
                </div>
                <div class="col-sm-3">
                    <b>End Date</b>: <?php echo $list->end_date?>
                </div>
                <div class="col-sm-2">
                    <b>Courier Name</b>: <?php echo $list->courier_name?>
                </div>
                <div class="col-sm-1">
                    <b>File</b>:
                    <?php if($list->file){
                        echo '<a target="_blank" href="'.$base_path.$list->file.'" download>File</a>';
                    } ?>
                </div>
                <div class="col-sm-3">
                    <b>Number of Orders </b>: <?php echo $list->count?>
                </div>

                <div class="col-sm-12 mt-5">
                    <h4>Details:</h4>
                    <ul class="list-group ">
                        <?php foreach($details as $detail) {?>
                        <li class="list-group-item mt-3">
                           <b> Order id</b>: <?php echo $detail['id']??'' ?> | <b>Order name</b>: <?php echo $detail['oname']??'' ?>
                            <hr>
                            <h6 class="h6">Customer:</h6>
                             <b>Name</b>: <?php echo $detail['name']??'' ?>
                             <b>phone</b>:<?php echo $detail['phone']??'' ?>
                             <b>address</b>: <?php echo $detail['address']??'' ?>
                             <b>Postcode</b>: <?php echo $detail['Postcode']??'' ?>

                        </li>
                        <?php } ?>
                    </ul>
                </div>


            </div>

        </main>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>






