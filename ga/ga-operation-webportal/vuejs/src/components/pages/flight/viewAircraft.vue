<template>
  <div style="width: 1280px; height: auto; margin-top:30px; background:white; padding-top: 30px">
    <div style = "width: 1190px;">
      <button class="div-button" style="width:88px; height:30px; border-radius:4px; border:1px solid #33A6FC; background-color: #FFFFFF; color:#33A6FC; float: right; cursor:pointer; margin-top: 20px; margin-bottom: 10px; margin-right:-40px"
              @click="cancel()" >返  回</button>
    </div>
    <table style="width: 1190px; border-spacing:0px; margin-left: 40px">
      <tbody>
      <tr>
        <td class="tr-1">机型名称</td>
        <td class="tr-2 tr-4">{{aircraft.planTypeName}} <Button type="primary" @click="viewPage" style="margin-left:45px">查看</Button></td>
        <td class="tr-1 tr-3">航空器注册号</td>
        <td class="tr-2 tr-4">{{aircraft.regNumber}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">航空器序列号</td>
        <td class="tr-2 tr-4">{{aircraft.airframeid}}</td>
        <td class="tr-1 tr-3">航空器拥有形式</td>
        <td class="tr-2 tr-4">{{aircraft.aircraftModel}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">所属单位</td>
        <td class="tr-2 tr-4">{{aircraft.companyName}}</td>
        <td class="tr-1 tr-3">所属管理局</td>
        <td class="tr-2 tr-4"> {{aircraft.authorityName}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">所属监管局</td>
        <td class="tr-2 tr-4">{{aircraft.supervisionName}}</td>
        <td class="tr-1 tr-3">产权人</td>
        <td class="tr-2 tr-4">{{aircraft.propertyOwner}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">航空器状态</td>
        <td class="tr-2 tr-4" >{{aircraft.aircraftStatus}}</td>
        <td class="tr-1 tr-3">出厂时间</td>
        <td class="tr-2 tr-4" >{{aircraft.productionDate}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">引进时间</td>
        <td class="tr-2 tr-4" >{{aircraft.introductionTime}}</td>
        <td class="tr-1 tr-3">国籍登记证编号</td>
        <td class="tr-2 tr-4" >{{aircraft.registernumber}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">适航证编号</td>
        <td class="tr-2 tr-4" >{{aircraft.airworthinessCertificateNumber}}</td>
        <td class="tr-1 tr-3">电台执照编号</td>
        <td class="tr-2 tr-4" >{{aircraft.radioLicenceNumber}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">电台执照失效日期</td>
        <td class="tr-2 tr-4" >{{aircraft.radioLicenceInvalidDate}}</td>
        <td class="tr-1 tr-3">飞行时间</td>
        <td class="tr-2 tr-4" >{{aircraft.flySumTime}}</td>
      </tr>
      <tr>
        <td class="tr-1 tr-3">起落次数</td>
        <td class="tr-2 tr-4" colspan="3" > {{aircraft.upDownTimes}}</td>
      </tr>
      </tbody>
    </table>
      <div class="form-addair" style="margin-top: 15px">
        <div>
          <div  v-if="aircraft.aircraftCatalogue" style="width: 250px;height:150px;margin-left: 40px;float:left;">
            <img :src="aircraft.aircraftCatalogue"  style="width: 250px;height:150px;"  @click="imgdetail('',aircraft.aircraftCatalogue)">
          </div>
          <div v-else style="margin-left:40px;float:left">
            <img :src="noimg" style="width: 250px;height:150px;;padding-left:5px;"/>
          </div>
          <div  v-if="aircraft.scanCatalogue" style="width: 250px;height:150px;margin-left: 40px;float:left">
            <img :src="aircraft.scanCatalogue"  style="width: 250px;height:150px;"  @click="imgdetail('',aircraft.scanCatalogue)">
          </div>
          <div v-else style="margin-left: 40px;float:left">
            <img :src="noimg" style="width: 250px;height:150px;padding-left:5px;"/>
          </div>
          <div  v-if="aircraft.radioLicenceCatalogue" style="width: 250px;height:150px;margin-left: 40px;float:left">
            <img :src="aircraft.radioLicenceCatalogue"  style="width: 250px;height:150px;"  @click="imgdetail('',aircraft.radioLicenceCatalogue)">
          </div>
          <div v-else style="margin-left: 40px;float:left">
            <img :src="noimg" style="width: 250px;height:150px;"/>
          </div>
          <div  v-if="aircraft.airworthinessCertificate" style="width: 250px;height:150px;margin-left:40px;float:left">
            <img :src="aircraft.airworthinessCertificate"  style="width: 250px;height:150px;"  @click="imgdetail('',aircraft.airworthinessCertificate)">
          </div>
          <div v-else style="margin-left: 40px;float:left">
            <img :src="noimg" style="width: 250px;height:150px;padding-left:5px;"/>
          </div>
        </div>
        <div class="bottom5" style="width:87%;margin-left:40px;" >
                <span style="width:100%;display:inline-block;text-align:right;padding-top: 10px">
                    <h2 style="float:left;">定检记录</h2>
                </span>
          <div style="margin-top:5px; margin-bottom: 15px">
            <Table border :columns="columns7" :data="checkRecord"></Table>
          </div>
        </div>
      </div>
    <imgdetail ref="imgdetailref"></imgdetail>
  </div>
</template>

<script>
    import noimg from '../../../../static/img/noimgpictrue.png';

    import imgdetail from '../../views/imgdetail.vue';

    export default {
        data() {
            return {
                add_dialog_show: false,
                noimg: noimg,
                temp:{
                    id:'',
                    aircaftId:'',
                    recordTitle:'',
                    completePerson:'',
                    completeTime:''

                },
                check_form: {},
                checkRecord:[],
                checkRecordindex:'',
                supervision:[],
                supervision1:[],
                supervision2:[],
                isDisaled:false,
                // isshow: true,
                // isshowupload: false,
                aircraft: {
                    aircraftId:'',
                    planTypeId: '',
                    companyId: '',
                    companyName: '',
                    regNumber: '',
                    planTypeName:'',
                    supervisionName:'',
                    authorityName:'',
                    superId: '',
                    managerId: '',
                    aircraftStatus: '',
                    aircraftModel: '',
                    introductionTime: '',
                    registernumber: '',
                    scanCatalogue:'',
                    airworthinessCertificateNumber: '',
                    airworthinessCertificate: '',
                    radioLicenceNumber:'',
                    radioLicenceCatalogue: '',
                    radioLicenceInvalidDate: '',
                    aircraftCatalogue:'',
                    productionDate: '',
                    airframeid: '',
                    flySumTime: '',
                    upDownTimes: '',
                    propertyOwner: '',

                },
                isflg:'',
                columns7: [
                    {
                        title: '定检记录标题',
                        key: 'recordTitle',
                        align: 'center',
                        width: 450
                    },
                    {
                        title: '定检完成人',
                        width: 350,
                        key: 'completePerson',
                        align: 'center'
                    },
                    {
                        title: '定检完成时间',
                        width: 310,
                        key: 'completeTime',
                        align: 'center'
                    }
                ]
            }
        },
        components: {

            imgdetail
        },
        mounted() {
            let self = this;

            self.aircraft = self.$route.query.aircraft;
            self.$http.httpGet('/eim/api/checkRecord/serach/getbyaircaftId', {

                aircaftId:self.$route.query.aircraft.aircraftId
            }).then(function (response) {
                let datainfo=response.data;
                self.checkRecord=datainfo;
            }) .catch(function (error) {
                console.log(error);
            });
            if(self.aircraft.productionDate!=null)
            {
                self.aircraft.productionDate = new Date(self.aircraft.productionDate);
            }
            if(self.aircraft.introductionTime!=null)
            {
                self.aircraft.introductionTime = new Date(self.aircraft.introductionTime);
            }
            if(self.aircraft.radioLicenceInvalidDate!=null)
            {
                self.aircraft.radioLicenceInvalidDate = new Date(self.aircraft.radioLicenceInvalidDate);
            }
        },
        created() {

        },
        methods: {
            imgdetail:function(title,path)
            {
                this.$refs.imgdetailref.initimgmodal(title,path);
            },
            //查看详情
            viewPage() {

                if(this.aircraft.planTypeId!=null&&this.aircraft.planTypeId!=""){
                    this.$router.push({path: '/viewType',query:{id:this.aircraft.planTypeId}});
                }else{
                    alert("请选择机型")
                }

            },
            cancel:function () {
                this.$router.go(-1);
            }
        }
    }
</script>

<style scoped>
  .tr-1 {
    font-size: 14px;
    width: 180px;
    padding-left: 13px;
    height: 45px;
    color:  #606265;
    border-left: solid 1px #DCDFE6;
    border-right: solid 1px #DCDFE6;
    border-bottom: solid 1px #DCDFE6;
    background-color: #F8F8F9;
  }
  .tr-2 {
    width: 200px;
    text-align: center;
    color:  #606265;
    background-color: #FFF;
  }

  table{
    border-collapse:collapse;
  }
  table tr td{
    border:1px solid #DCDFE6;
  }

  .tr-3{
    background-color: #f8f8f9;
  }

  /*.tr-4{*/
  /*background-color: #FFF;*/
  /*}*/
  .tr-5{
    background-color: #f8f8f9;
  }

  .everyf{
    border: 1px solid ;
    border-color: #bbbec4;
    margin-top: 5px;
    position: relative;
  }
  .child{
    position: absolute;
    top:60px;
    right: 20px;
    width: 283px;
  }

  .flag{
    position: absolute;
    top: 5px;
    right: 3px;

  }
  .flag>img{
    width: 30px;
    display: block;
  }

  .form{
    width: 900px;
    background-color: #363636
  }




  .ivu-input-icon+.ivu-input{
    height: 30px;
    background: #b3b3b3;
    padding-right: 0;
  }
  .ivu-row{
    margin-bottom: 30px;
  }
  .submit-btn {
    font-size: 14px;
    margin: 0px 30px;
    display: inline-block;
    width: 120px;
    height: 35px;
    line-height: 30px;
    border: 1px solid #ececec;
    border-radius: 3px;
    color: #FFF;
    background: -webkit-linear-gradient(#a3a3a3, #e7e7e7);
    background: linear-gradient(#a3a3a3, #e7e7e7);
  }
  .flybase-submit-div a:hover {
    display: inline-block;
    width: 120px;
    height: 35px;
    line-height: 30px;
    border: 1px solid #ececec;
    border-radius: 3px;
    color: black;
    background: -webkit-linear-gradient(#e7e7e7, #a3a3a3);
    background: linear-gradient(#e7e7e7, #a3a3a3);
  }
  .bottom5 {
    color: #657180;
    margin-bottom: 15px;
  }
</style>