<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					Formulir 
				</h4>
			</div>
			<div class="modal-body no-padding">

				<form id="form-data" class="smart-form">
					<fieldset>

                        <div class="row">
							<section class="col col-md-4">Jenis Bidang</section>
							<section class="col col-md-8">
								<label for="" class="select">
                                    <select class="select2" name="tblizin_id" id="tblizin_id">
                                        <option value="">== Silahkan Pilih ==</option>
                                        <?php foreach ($data['izin'] as $l) : ?>
                                            <option value="<?= $l['tblizin_id'] ?>"><?= $l['tblizin_nama'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </label>
							</section>
						</div>

						<div class="row">
							<section class="col col-4">Nama Sub Bidang</section>
							<section class="col col-8">
								<label class="input">
									<input type="text" class="input" id="refsubbidanglayanan_nama" name="refsubbidanglayanan_nama">
								</label>
							</section>
						</div>

						<div class="row">
							<section class="col col-md-4">Status Aktif</section>
							<section class="col col-md-8">
								<div class="inline-group">
									<label class="radio">
										<input type="radio" name="refsubbidanglayanan_status" id="refsubbidanglayanan_status_T" class="refsubbidanglayanan_status" value="T" checked="">
										<i></i> Aktif
									</label>
									<label class="radio">
										<input type="radio" name="refsubbidanglayanan_status" id="refsubbidanglayanan_status_F" class="refsubbidanglayanan_status" value="F">
										<i></i> Non Aktif
									</label>
								</div>
							</section>
						</div>

					</fieldset>
					<footer>
						<a href="javascript:void(0);" class="btn btn-default " data-dismiss="modal"><i class="fa fa-ban"></i> Batal</a>
						<button id="btnSubmit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan</button>
					</footer>
				</form>
			</div>

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript">
	jQuery(document).ready(function($) {
		pageSetUp();
		/*form validation*/
		loadScript("<?php echo Yii::app()->getBaseUrl(1); ?>/themes/smartadmin/js/plugin/jquery-form/jquery-form.min.js", runFormValidation);
		jQuery.validator.addMethod("number_ID", function(value, element) {
			// allow any non-whitespace characters as the host part
			return this.optional(element) || /^-?(?:\d+|\d{1,3}(?:[\s\.,]\d{3})+)(?:[\.,]\d+)?$/.test(value);
		}, 'Mohon isikan dalam angka, pemisah desimal adalah koma (,)');
		jQuery.validator.addMethod("min_ID", function(value, element, params) {
			// allow any non-whitespace characters as the host part
			return this.optional(element) || toAngka(value) <= params[0];
		}, 'Mohon isikan dalam angka yang lebih dari {0}');
		jQuery.validator.addMethod("latitude", function(value, element) {
			// allow any non-whitespace characters as the host part
			return this.optional(element) || /^(\+|-)?(?:90(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,6})?))$/.test(value);
		}, 'Mohon isikan dalam angka, pemisah desimal adalah titik (.) range (-90 s/d +90) dengan maks 6 angka desimal');
		jQuery.validator.addMethod("longitude", function(value, element) {
			// allow any non-whitespace characters as the host part
			return this.optional(element) || /^(\+|-)?(?:180(?:(?:\.0{1,6})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,6})?))$/.test(value);
		}, 'Mohon isikan dalam angka, pemisah desimal adalah titik (.) range (-180 s/d +180) dengan maks 6 angka desimal');
		function runFormValidation() {
			var $FormData =window.validation_form_data = $("#form-data").validate({
				// Rules for form validation
				rules : {
					"tblizin_id" : {
						required : true,
					},
					"refsubbidanglayanan_nama" : {
						required : true,
					},
					"refsubbidanglayanan_status" : {
						required : true,
					},
				},

				// Messages for form validation
				messages : {
					"tblizin_id" : {
						required : "Mohon isikan entrian berikut ",
					},
					"refsubbidanglayanan_nama" : {
						required : "Mohon isikan entrian berikut ",
					},
					"refsubbidanglayanan_status" : {
						required : "Mohon isikan entrian berikut ",
					},
				},

				// Do not change code below
				errorPlacement : function(error, element) {
					error.insertAfter(element.parent());
				},
				submitHandler : function(form) {
					// saat validasi benar semua, jalankan simpan()
					return simpan();
				}
			});

			function addRules(rulesObj){
				for (var item in rulesObj){
					$('#'+item).rules('add',rulesObj[item]);
				}
				// console.log('add');
				// console.log(rulesObj);
			}
			function removeRules(rulesObj){
				for (var item in rulesObj){
					$('#'+item).rules('remove');
				}
				// console.log('remove');
				// console.log(rulesObj);
			}
		};
		/*form validation*/

		$('#tblizin_id').change(function (e) {
			getSubBidangByBidang('refsubbidanglayanan_id', $('#tblizin_id').val())
		});
	});
</script>