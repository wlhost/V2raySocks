<!-- CSS -->
<link rel="stylesheet" href="modules/servers/{$module}/templates/static/css/style.css">
<script src="modules/servers/{$module}/templates/static/js/Chart.js"></script>
<script src="modules/servers/{$module}/templates/static/js/qrcode.js"></script>
<script src="modules/servers/{$module}/templates/static/js/html5-qrcode.js"></script>
<script>
    function send(arg) {
      CreateXMLHttpRequest();
      xmlhttp.onreadystatechange = callhandle;
      xmlhttp.open("GET", arg,true);
      xmlhttp.onreadystatechange = processResponse;
      xmlhttp.send(null);
    }

    function CreateXMLHttpRequest() {
      if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
      else if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
      }
    }
    
    function callhandle() {
      if (xmlhttp.readyState == 4) {
        if (xmlhttp.status == 200) {
          alert(xmlhttp.responseText);
        }
      }
    }
    
    function processResponse(){
        if(xmlhttp.readyState == 4){     //判断对象状态
            if(xmlhttp.status == 200){
            }else{
                //alert("HTTP 200");
            }
        }
    }
</script>
<style>
.table-container
{
width: 100%;
overflow-y: auto;
_overflow: auto;
margin: 0 0 1em;
}

.table-container::-webkit-scrollbar
{
-webkit-appearance: none;
width: 14px;
height: 14px;
}

.table-container::-webkit-scrollbar-thumb
{
border-radius: 8px;
border: 3px solid #fff;
background-color: rgba(0, 0, 0, .3);
}

.table-container-outer { position: relative; }

.table-container-fade
{
	position: absolute;
	right: 0;
	width: 30px;
	height: 100%;
	background-image: -webkit-linear-gradient(0deg, rgba(255,255,255,.5), #fff);
	background-image: -moz-linear-gradient(0deg, rgba(255,255,255,.5), #fff);
	background-image: -ms-linear-gradient(0deg, rgba(255,255,255,.5), #fff);
	background-image: -o-linear-gradient(0deg, rgba(255,255,255,.5), #fff);
	background-image: linear-gradient(0deg, rgba(255,255,255,.5), #fff);
}
</style>
{if ($infos)}
	<div class="alert alert-success">
		<p>{$infos}</p>
	</div>
{/if}
<div class="plugin">
    <div class="row">
        <div class="col-md-12">
            <aside class="profile-nav alt hidden-xs">
                <section class="panel">
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="javascript:;"> <i class="fa fa-calendar-check-o"></i> {$LANG.clientareahostingregdate} : {$regdate} </a></li>
                        <li><a href="javascript:;"> <i class="fa fa-list-alt"></i> {$LANG.orderproduct} : {$groupname} - {$product} </a></li>
                        <li><a href="javascript:;"> <i class="fa fa-money"></i> {$LANG.orderpaymentmethod} : {$paymentmethod} {$LANG.firstpaymentamount}({$firstpaymentamount}) - {$LANG.recurringamount}({$recurringamount})</a></li>
                        <li><a href="javascript:;"> <i class="fa fa-spinner"></i> {$LANG.clientareahostingnextduedate} : {$nextduedate} {$LANG.orderbillingcycle}({$billingcycle}) </a></li>
                        <li><a href="javascript:;"> <i class="fa fa-check-square-o"></i> {$LANG.clientareastatus} : {$status} </a></li>
						<li><a href="javascript:;"> <i class="fa fa-check-square-o"></i> {V2raySocks_get_lang('data_update_at')} : {$nowdate} </a></li>
                    </ul>
                </section>
            </aside>
            {if $subscribe_enable == 1}
            <section class="panel">
                <header class="panel-heading">
                    {V2raySocks_get_lang('subscribe_info')}
                </header>
                <div class="panel-body table-container">
                    <table class="table general-table">
                        <thead>
                            <tr>
                                <th>{V2raySocks_get_lang('subscribe_url')}</th>
                                <!--<th>{V2raySocks_get_lang('subscribe_token')}</th>-->
                                <th class="hidden-xs hidden-sm">{V2raySocks_get_lang('action')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{$HTTP_HOST}/modules/servers/UnlimitedSocks/subscribe.php?sid={$serviceid}&token={$subscribe_token}</td>
                                <!--<td>{$subscribe_token}</td>-->
                                <td class="hidden-xs hidden-sm"><button type='button' class='btn btn-danger btn-block' onclick='ResetToken{$serviceid}()'>{V2raySocks_get_lang('reset_subscribe_token')}</button>
                                <script>
                                    function ResetToken{$serviceid}(){
                                        layer.confirm('{$LANG.remoteAuthn.areYouSure}?', {
                                          btn: ['{$LANG.confirm}','{$LANG.orderForm.cancel}']
                                        }, function(){
                                          send('{$smarty.server.REQUEST_URI|replace:'&amp;':'&'}&UnlimitedSocksAction=ResetToken&Serviceid={$serviceid}&TimeToken={time()}');
                                          layer.msg('{$LANG.moduleactionsuccess}');
                                          location.reload();
                                        });
                                    }
                                </script>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            {/if}
            <section class="panel">
                <header class="panel-heading">
                    {V2raySocks_get_lang('user_info')}
                </header>
                <div class="panel-body table-container">
                    <table class="table general-table">
                        <thead>
                            <tr>
                                <th>{V2raySocks_get_lang('uuid')}</th>
                                <th class="hidden-xs hidden-sm">{V2raySocks_get_lang('created_at')}</th>
                                <th class="hidden-sm hidden-xs">{V2raySocks_get_lang('last_use_time')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>{$usage.uuid}</td>
                                <td class="hidden-xs hidden-sm">{$usage.created_at|date_format:'%Y-%m-%d %H:%M:%S'}</td>
                                <td class="hidden-sm hidden-xs">{$usage.t|date_format:'%Y-%m-%d %H:%M:%S'}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!--progress bar start-->
            <section class="panel">
                <header class="panel-heading">
                    {V2raySocks_get_lang('usage_chart')} ({V2raySocks_get_lang('bandwidth')}：{$usage.tr_MB_GB})
                </header>
                <div class="panel-body" id="plugin-usage">
                    <p>{V2raySocks_get_lang('used')} ({$usage.s_MB_GB})</p>
                    <div class="progress progress-striped progress-sm">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="{($usage.sum/$usage.transfer_enable)*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($usage.sum/$usage.transfer_enable)*100}%">
                            <span class="sr-only">{($usage.sum/$usage.transfer_enable)*100}% Complete</span>
                        </div>
                    </div>
                    <p>{V2raySocks_get_lang('upload')} ({$usage.u_MB_GB})</p>
                    <div class="progress progress-striped progress-sm">
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="{($usage.u/$usage.transfer_enable)*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($usage.u/$usage.transfer_enable)*100}%">
                            <span class="sr-only">{($usage.u/$usage.transfer_enable)*100}% Complete (warning)</span>
                        </div>
                    </div>
                    <p>{V2raySocks_get_lang('download')} ({$usage.d_MB_GB})</p>
                    <div class="progress progress-striped progress-sm">
                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="{($usage.d/$usage.transfer_enable)*100}" aria-valuemin="0" aria-valuemax="100" style="width: {($usage.d/$usage.transfer_enable)*100}%">
                            <span class="sr-only">{($usage.d/$usage.transfer_enable)*100}% Complete (danger)</span>
                        </div>
                    </div>
                </div>
            </section>
            
            <section class="panel">
                <header class="panel-heading">
                    {V2raySocks_get_lang('routelist')}
                </header>
                <div class="panel-body table-container">
                    <table class="table table-hover general-table">
                        <thead>
                            <tr>
                                <th>{V2raySocks_get_lang('name')}</th>
                                <th class="hidden-xs hidden-sm">{V2raySocks_get_lang('address')}</th>
                                <th class="hidden-xs hidden-sm">{V2raySocks_get_lang('method')}</th>
                                <th class="hidden-xs hidden-sm">{V2raySocks_get_lang('port')}</th>
                                <th class="hidden-xs hidden-sm">{V2raySocks_get_lang('obfuscation')}</th>
                                <th class="hidden-xs hidden-sm">TLS</th>
                                <th>{V2raySocks_get_lang('action')}</th>
                            </tr>
                        </thead>
                        <tbody>
							{$yy = 0}
                            {foreach $nodes as $node }
                            <tr>
                                <td>{$node[0]}</td>
                                <td class="hidden-xs hidden-sm">{$node[1]}</td>
                                <td class="hidden-xs hidden-sm">{$node[3]}</td>
                                <td class="hidden-xs hidden-sm">{$node[2]}</td>
                                <td class="hidden-xs hidden-sm">{if ($node[4])}{$node[4]}{else}X{/if}</td>
                                <td class="hidden-xs hidden-sm">{if ($node[4])}√{else}X{/if}</td>
                                <td data-hook="action">
                                        <button name="qrcode" class="btn btn-primary btn-xs" data-type="vmess" data-params="{$node[6]|unescape:"htmlall"}">
                                            <i class="fa fa-qrcode"></i>
                                            {V2raySocks_get_lang('show_QRcode')}
                                        </button>
                                        <button name="url" class="btn btn-primary btn-xs" data-params="{$node[6]|unescape:"htmlall"}">
                                            <i class="fa fa-qrcode"></i>
                                            {V2raySocks_get_lang('show_URL')}
                                        </button>
                                    {$yy = $yy + 1}
                                </td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </section>

			{if ($script)}
			<section class="panel">
                <header class="panel-heading">
                    {V2raySocks_get_lang('traffic_chart')} ({$datadays} {V2raySocks_get_lang('days')})
                </header>
                <div class="panel-body" id="chart-usage">
					
					<div class="row clearfix">
						<div class="col-xs-12">
							<h3 class="block-title text-primary">{V2raySocks_get_lang('all_traffic_chart')}</h3>
							<canvas id="totalc" ></canvas>
						</div>
						<div class="col-xs-12">
							<h3 class="block-title text-primary">{V2raySocks_get_lang('upload_traffic_chart')}</h3>
							<canvas id="uploadc" ></canvas>
						</div>
						<div class="col-xs-12">
							<h3 class="block-title text-primary">{V2raySocks_get_lang('download_traffic_chart')}</h3>
							<canvas id="downloadc" ></canvas>
						</div>
					</div>
				
				
					<script src="/assets/js/bootstrap-tabdrop.js"></script>
					<script type="text/javascript">
						{$script|unescape:"htmlall"}
					</script>
                </div>
            </section>
			{/if}
			
        </div>
    </div>
</div>
<!-- JavsScript -->
<script src="modules/servers/{$module}/templates/static/layer.js"></script>
<script src="modules/servers/{$module}/templates/static/js/SSRscript.js" charset="utf-8"></script>