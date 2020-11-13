<?php define('ASSETS_URL', 'themes/smartadmin'); ?>

<h1 class="page-title txt-color-blue">
    <i class="fa fa-file-text-o fa-lg "></i>
    <strong><?php echo $this->MODUL_JUDUL ?></strong>
</h1>

<!-- widget grid -->
<section id="widget-grid" class="">

    <div class="row">

        <!-- NEW WIDGET START -->
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden">

            <!-- Widget ID (each widget will need unique ID)-->
            <div class="jarviswidget jarviswidget-color-blue" id="wid-id-filtermisi" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-collapsed="false" data-widget-togglebutton="false" data-widget-colorbutton="false">
                <!-- widget options:
		usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

		data-widget-colorbutton="false"
		data-widget-editbutton="false"
		data-widget-togglebutton="false"
		data-widget-deletebutton="false"
		data-widget-fullscreenbutton="false"
		data-widget-custombutton="false"
		data-widget-collapsed="true"
		data-widget-sortable="false"

	-->
                <header style="border-radius: 3px 3px 0 0;">
                    <span class="widget-icon"> <i class="fa fa-search"></i> </span>
                    <h2>Pencarian Data</h2>
                </header>

                <!-- widget div-->
                <div>

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->

                    </div>
                    <!-- end widget edit box -->

                    <!-- widget content -->
                    <div class="widget-body no-padding">
                        <form id="form-cari" class="smart-form">
                            <fieldset>
                                <div class="row">
                                    <section class="col col-md-2">Periode</section>
                                    <section class="col col-md-2">
                                        <label class="select">
                                            <select name="refperiode_id" id="cari_refperiode_id">
                                                <option value="">== Silahkan Pilih ==</option>
                                                <?php foreach ($data['periode'] as $l) : ?>
                                                    <option value="<?= $l['refperiode_id'] ?>"><?= $l['refperiode_keterangan'] ?></option>
                                                <?php endforeach; ?>
                                            </select><i></i>
                                        </label>
                                    </section>
                                    <section class="col col-md-2">
                                        <button class="btn btn-sm btn-primary" type="button" id="btnCari"><i class="fa fa-search"></i> Cari</button>
                                    </section>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <!-- end widget content -->

                </div>
                <!-- end widget div -->

            </div>
            <!-- end widget -->

        </article>
        <!-- WIDGET END -->
    </div>

    <!-- row -->
    <div class="row">

        <!-- NEW WIDGET START -->
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <!-- Widget ID (each widget will need unique ID)-->
            <div class="jarviswidget jarviswidget-color-green" id="wid-id-<?php echo md5($this->MODUL_JUDUL) ?>" data-widget-sortable="false" data-widget-editbutton="false" data-widget-deletebutton="false" data-widget-collapsed="false" data-widget-togglebutton="false" data-widget-colorbutton="false">
                <!-- widget options:
				usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

				data-widget-colorbutton="false"
				data-widget-editbutton="false"
				data-widget-togglebutton="false"
				data-widget-deletebutton="false"
				data-widget-fullscreenbutton="false"
				data-widget-custombutton="false"
				data-widget-collapsed="true"
				data-widget-sortable="false"

			-->
                <header style="border-radius: 3px 3px 0 0;">
                    <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                    <h2><?php echo $this->MODUL_JUDUL ?></h2>
                </header>

                <!-- widget div-->
                <div>

                    <!-- widget edit box -->
                    <div class="jarviswidget-editbox">
                        <!-- This area used as dropdown edit box -->

                    </div>
                    <!-- end widget edit box -->

                    <!-- widget content -->
                    <div class="widget-body no-padding">
                        <div class="widget-body-toolbar">
                            <button id="btnTambah" rel="tooltip" data-placement="right" data-original-title="digunakan untuk menambah data" class="btn btn-primary" rel="tooltip" data-placement="right" data-original-title="digunakan untuk menambah data">
                                <i class="fa fa-plus-square"></i> Tambah Data
                            </button>
                        </div>
                        <table id="dt_pipeline" class="table table-bordered table-striped table-condensed table-hover has-tickbox">
                            <thead>
                                <tr>
                                    <th data-class="expand">
                                        <div align="center">No</div>
                                    </th>
                                    <th>
                                        <div align="center">Jenis Bidang</div>
                                    </th>
                                    <th>
                                        <div align="center">Jenis Sub Bidang</div>
                                    </th>
                                    <th>
                                        <div align="center">Ditampilkan/Aktif?</div>
                                    </th>
                                    <th>
                                        <div align="center">#</div>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>

                    </div>
                    <!-- end widget content -->

                </div>
                <!-- end widget div -->

            </div>
            <!-- end widget -->

        </article>
        <!-- WIDGET END -->
    </div>

</section>
<!-- end widget grid -->

<div id="div_form"></div>
<div id="div_form_sub"></div>

<?php include 'form2nd.php' ?>

<script type="text/javascript">
    pageSetUp();

    $(document).ready(function() {
        reloadDT('dt_basic');
        $("#btnTambah").click(function(event) {
            tambah();
        });
        $("#btnCari").click(function(e) {
            cari();
        });
    });


    function cari() {
        load_grid();
    }

    $(document).ready(function() {
        load_grid();
    });

    function load_form(CALLBACK_FUNCTION) {
        $.ajax({
                url: '<?= $this->MODUL_URL ?>/load_form',
                type: 'POST',
                data: {
                    token: '<?= md5(microtime()) ?>'
                },
            })
            .done(function(respon) {
                $("#div_form").html(respon);
                if (typeof CALLBACK_FUNCTION != 'undefined') {
                    CALLBACK_FUNCTION(); // panggil callback function
                }
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }

    function load_form_sub(form, mst_id, CALLBACK_FUNCTION) {
        window.mst_id = mst_id;
        $.ajax({
                url: '<?= $this->MODUL_URL ?>/load_form_sub',
                type: 'POST',
                data: {
                    token: '<?= md5(microtime()) ?>',
                    form: form,
                    mst_id: mst_id,
                },
            })
            .done(function(respon) {
                $("#div_form").html(respon);
                if (typeof CALLBACK_FUNCTION != 'undefined') {
                    CALLBACK_FUNCTION(); // panggil callback function
                }
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }

    function load_grid() {
        var param = {};
        var url_param = jQuery.param(param);
        var url_param = $("#form-cari").serialize() + '&' + jQuery.param(param);
        var totalRecords = <?php echo $data['total_data'] ?>; // total no of records
        var ajaxUrl = "<?php echo $this->MODUL_URL ?>/DTJSON?" + url_param // url that fetches the data for the table
        COLUMN = [{
                "data": "num",
                "orderable": false
            },
            {
                "data": "tblizin_nama",
                "orderable": false,
                "render": function(data, type, row, meta) {
                    var dthtml = data;
                    return dthtml;
                }
            },
            {
                "data": "refsubbidanglayanan_nama",
                "orderable": false,
                "render": function(data, type, row, meta) {
                    var dthtml = data;
                    return dthtml;
                }
            },
            {
                "data": "refsubbidanglayanan_status",
                "orderable": false,
                "render": function(data, type, row, meta) {
                    var dthtml = data;
                    dthtml = '<b class="txt-color-red">Tidak Aktif</b>'
                    if (data == 'T') {
                        dthtml = '<b class="txt-color-green">Aktif</b>'
                    }
                    return dthtml;
                }
            },
            {
                "data": "enc_id",
                "orderable": false,
                "render": function(data, type, row, meta) {
                    var html = '';
                    html +=
                        '<div align="center">' +
                        '<a onclick="edit(\'' + row['enc_id'] + '\')" href="javascript:void(0)" class="btn btn-warning btn-sm"><i class="fa fa-pencil"></i> Edit</a> ' +
                        '<a onclick="hapus(\'' + row['enc_id'] + '\')" href="javascript:void(0)" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i> Hapus</a> ' +
                        '</div>'
                    return html;
                }
            },
        ];
        ORDERS = [
            [0, "asc"]
        ];
        drawTablePipeLine($('#dt_pipeline'), 1, totalRecords, ajaxUrl, COLUMN, ORDERS, pageSetUp); //Initializes the datatable
    }

    function detail_analisis(aid) {
        window.location.assign('<?php echo Yii::app()->getBaseUrl(1) ?>/#aid/index/AID/' + aid);
    }

    function tambah() {
        window.data_cmd = 'tambah';
        window.data_id = '';
        load_form(function() {
            $("#modal").modal('show');
            pageSetUp();
        });
    }

    function edit(id, props) {
        window.data_id = id;
        window.data_cmd = 'edit';
        load_form(function() {
            $.ajax({
                url: '<?= $this->MODUL_URL ?>/getData',
                type: 'POST',
                dataType: 'json',
                data: {
                    id: id
                },
                success: function(respon) {
                    window.respon = respon;
                    exclude = [];
                    toInt = [];
                    toTglId = [];
                    $.each(respon, function(index, val) {
                        if (!inArray(index, exclude)) {
                            $("#" + index).val(respon[index]);
                            $("#" + index).select2('val', respon[index] != "0" ? respon[index] : "");
                            $("input[type=radio][value='" + respon[index] + "']." + index).prop('checked', true); //pilih radio button
                            if (inArray(index, toInt)) {
                                $("#" + index).val(parseInt(respon[index]));
                            }
                            if (inArray(index, toTglId)) {
                                $("#" + index).val(respon[index].split(' ')[0].split('-').reverse().join('-'));
                            }
                        }
                    });
                    // $("#refskpd_id option[data-hash='" + respon['refskpd_id_hash'] + "']").attr('selected', 1);
                    var url = (respon.url_berkas != '' && respon.url_berkas != null) ? '<a target="_blank" href="' + respon.url_berkas + '">Lihat berkas terupload</a>' : '';
                    // console.log(respon);
                    // getSubBidangByBidang('refsubbidanglayanan_id', respon.tblizin_id, respon.refsubbidanglayanan_id);
                    $("#<?php echo "{$this->TABEL}_filependukung" ?>_uploaded").html(url);
                    $("#modal").modal('show');
                    pageSetUp();
                    // setPriceFormat();
                }
            });
        });
    }

    function hapus(id) {
        window.data_id = id;
        window.data_cmd = "hapus";

        $.SmartMessageBox({
            title: "Konfirmasi",
            content: "Apakah anda yakin akan menghapus Data ini?",
            buttons: '[Tidak][Ya]'
        }, function(ButtonPressed) {
            if (ButtonPressed === "Ya") {

                $.ajax({
                        url: '<?= $this->MODUL_URL ?>/Hapus',
                        type: 'POST',
                        data: {
                            id: id
                        },
                        dataType: 'json',
                        success: function(respon) {}
                    })
                    .done(function(respon) {
                        if (respon.status == 'success') {
                            notifikasi("Sukses", "Data berhasil dihapus", "success", 1, 0);
                            cari();
                        } else {
                            notifikasi("Gagal", "Data gagal dihapus", "failed", 1, 0);
                        }
                    })
                    .fail(function(jqXHR, exception) {
                        handelErr(jqXHR, exception)
                    })
                    .always(function() {
                        console.log("complete");
                    });
            }
        });
    }

    function simpan() {
        var param = {
            cmd: window.data_cmd,
            id: window.data_id,
        };
        $("#btnSubmit").attr('disabled', !0);

        var form = $('#form-data')[0];
        var formData = new FormData(form);
        // Attach file
        $.each(param, function(kolom, nilai) {
            formData.append(kolom, nilai);
        });

        $.ajax({
                url: '<?php echo $this->MODUL_URL ?>/simpan',
                type: 'POST',
                dataType: 'json',
                contentType: false, // wajib utk upload file ajax
                processData: false, // wajib utk upload file ajax
                cache: false,
                data: formData
            })
            .done(function(response) {
                if (response.status == 'success') {
                    notifikasi("Sukses", "Data berhasil disimpan", "success", 1, 0);
                    cari();
                    $('#modal').modal('hide');
                } else if (response.status == 'file_ext_not_valid') {
                    notifikasi("Maaf", response.message, "x", 1, 0);
                    cari();
                    $('#modal').modal('hide');
                } else {
                    notifikasi("Gagal", "Data gagal disimpan", "failed", 1, 0);
                }
            })
            .fail(function(jqXHR, exception) {
                handelErr(jqXHR, exception);
                console.log("error");
            })
            .always(function() {
                console.log("complete");
                $("#btnSubmit").removeAttr('disabled');
            });
    }
</script>