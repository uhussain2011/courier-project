<?php
//include_once 'DB/info.php';
//include_once 'DB/db.php';
include_once 'Classes/courierfunc.php';
include_once 'Classes/files.php';

/*

class Create extends Dcon  {
    use Fileupload;

    function GetData($table) {
        $query = "SELECT id FROM ".$table." ORDER by id desc limit 1";
        $stm = $this->connect()->query($query);
        $rows = $stm->fetch(PDO::FETCH_ASSOC);
        return $rows['id']??0;
    }

    function setconsignmentsh($data)
    {

        $sql = "INSERT INTO `consignmentsh` (`start_date`, `end_date`, `courier_name`, `status`, `file`,  `created_at`, `updated_at`) VALUES (?,?,?,?,?,?,?)";
        $is_true =  $this->connect()->prepare($sql)->execute($data);
       if($is_true)
       {
           $id = $this->GetData('consignmentsh');

           foreach ($_POST['order_id'] as $order_id)
           {
               $query = "INSERT INTO `consignment_details`(`order_id`, `consignment_id`, `created_at`, `updated_at`) VALUES (?,?,?,?)";
                $this->connect()->prepare($query)->execute([$order_id,$id, date("Y-m-d h:i:s"), date("Y-m-d h:i:s")]);
           }

       }

       return true;

    }
}
*/


$create = new Create();

if (isset($_POST['status'])) {

    $reqest = array_fill(0, 7, null);
    if (isset($_POST['status']) && $_POST['status'] == 'Start')
        $reqest[0] = date("Y-m-d h:i:s");
    if (isset($_POST['status']) && $_POST['status'] == 'End')
        $reqest[1] = date("Y-m-d h:i:s");

    $reqest[2] = $_POST['couriers'];
    $reqest[3] = $_POST['status'];
    $reqest[4] = file_exists($_FILES['file']['tmp_name'])?$create->Savefile($_FILES) : null ;
    $reqest[5] = date("Y-m-d h:i:s");
    $reqest[6] = date("Y-m-d h:i:s");

    $is_save = $create->setconsignmentsh($reqest);

   if($is_save)
   {

       $_SESSION["type"] = "alert-success";
       $_SESSION["message"] = "Record Save successfully";

       header("LOCATION: ".$base_path);
   }
}
?>
<?php
include_once './layout/header.php';
?>

<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-4">

            <div class="my-3 p-3 mt-5 rounded shadow-sm album py-5 bg-light">
                <h6 class="border-bottom border-gray pb-2 mb-0">Consignment</h6>
                        <form action="" class="mt-5" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-6">

                            <div class="form-group">
                                <label for="exampleInputEmail1">Start/End Consignment</label>
                                <select name="status" class="form-control" id="exampleFormControlSelect1">
                                    <option value="">Select</option>
                                    <option value="Start">Start</option>
                                    <option value="End">End</option>
                                </select>
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                                </div>
                                <div class="col-6">

                            <div class="form-group">
                                <label for="exampleInputEmail1">Couriers</label>
                                <select name="couriers" class="form-control" id="exampleFormControlSelect1">
                                    <option  value="">Select</option>
                                    <option  value="Royal Mail">Royal Mail</option>
                                    <option  value="DHL">DHL</option>
                                    <option  value="ParcelForce">ParcelForce</option>
                                    <option  value="DPD">DPD</option>
                                </select>
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                                </div>
                                <div class="col-6">

                            <div class="form-group">
                                <label for="exampleInputEmail1">Order </label>
                                <select multiple name="order_id[]" id="ee" class="form-control"   >
                                </select>
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                                </div>
                                <div class="col-6">

                            <div class="form-group">
                                <label for="exampleInputEmail1">File </label>
                                <input class="form-control-file"  id = "exampleInputEmail1" type="file" name="file" id="">
                                <small id="emailHelp" class="form-text text-muted"></small>
                            </div>
                                </div>
                                <div class="col-6">
                                     <button type="submit" class="btn btn-primary">Submit</button>
                                     <button type="reset" class="btn btn-secondary">reset</button>
                                </div>
                            </div>
                        </form>
            </div>
        </main>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.full.js"></script>

<script>

    var SITEURL = '<?php echo $base_path  ?>'+'Classes/main.php';
$("#ee").select2({
        multiple: true,
        ajax: {
            url: SITEURL,
            dataType: 'json',
            delay: 250,
            data: function (params) {
        return {
                q: params.term, // search term
                page: params.page,
                ajax: "true"
        };
            },
            processResults: function (data, page) {
        return {
            results: data
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; },
        minimumInputLength: 1,
        templateResult: formatRepo,
        templateSelection: formatRepoSelection

    });

    function formatRepo (repo) {
        if (repo.loading) return repo.text;

        var markup =
            '<div class="avatar">' +
            '<div class="col-sm-6">' + repo.id +' | '+ repo.name + '</div>'
        ;
        markup += '</div></div>';
        return markup;
    }

    function formatRepoSelection (repo) {
        return repo.id +' | '+ repo.name;
        console.log(repo.id);
    }

</script>
</body>
</html>
