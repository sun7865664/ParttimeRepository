<template>
  <div style="width: 1280px; height: 900px; margin-top: 30px; background:white">

    <Form :model="aircraft" :label-width="100" style="padding: 28px 0 0 0;" ref="aircraftRef">
      <FormItem label="航空器注册号" style="width:267px;float: left;margin-left: 40px;" prop="regNumber">
        <Input v-model="aircraft.regNumber" placeholder="请输入注册号"></Input>
      </FormItem>
      <!--<FormItem label="人员类型" style="width:267px;float: left;margin-left: 8px;">
          <Input v-model="formItem.jobTitle" placeholder="请输入帐号"></Input>
      </FormItem>-->

      <FormItem label="航空器状态" style="width:267px;float: left;" prop="aircraftStatus">
        <Select v-model="aircraft.aircraftStatus" placeholder="请选择"  >
          <Option value="在用">在用</Option>
          <Option value="大修">大修</Option>
          <Option value="报停">报停</Option>
          <Option value="报废">报废</Option>
          <Option value="维护">维护</Option>
        </Select>
      </FormItem>
      <FormItem  style="width:100px;height: 20px; float: left; margin-left: -32px;">
        <Button type="primary" @click="init(1)">查询</Button>
      </FormItem>
      <FormItem  style="width:100px;height: 20px; float: left; margin-left: -32px;">
        <Button type="primary" @click="reset">重置</Button>
      </FormItem>
    </Form>
    <div>
      <div>
        <div>
                <span style="width:100%; display:inline-block;text-align:right; margin-top: -30px">
                    <Button type="primary" @click="add_dialog_show()" icon="plus" style="width: 98px;height: 32px;margin:24px 18px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">增  加</Button>
                     <Button type="primary" @click="down_dialog_show()" icon="plus" style="width: 98px;height: 32px; margin:24px 43px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">导 出</Button>
                </span>

          <div class="bottom5" style="margin-right: 43px; margin-left: 43px">
            <Table border :columns="columns7" :data="aircraftList"  @on-row-dblclick="userinfo"></Table>
          </div>
          <Page :total="pagecount" @on-change="pageclick" @on-page-size-change="pagesizeclick" :page-size="pagesize" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
        </div>
      </div>
    </div>

  </div>
</template>

<script>

    import word from '../company/uploadfile.vue';
    import IForm from "../../../../node_modules/iview/src/components/form/form.vue";
    import Cookies from 'js-cookie';
    export default {
        data() {
            return {

                aircraft: {
                    regNumber: '',
                    aircraftStatus: '',
                },

                pagesize:10,
                pagecount:0,
                count:1,
                aircraftList: [],
                columns7: [
                    {
                        title: '机型名称',
                        width: 180,
                        key: 'planTypeName',
                        align: 'center'
                    },{
                        title: '注册号',
                        key: 'regNumber',
                        align: 'center',
                        width: 180
                    },
                    {
                        title: '航空器拥有形式',
                        width: 150,
                        key: 'aircraftModel',
                        align: 'center'
                    },
                    {
                        title: '企业名称',
                        width: 210,
                        key: 'companyName',
                        align: 'center'
                    },{
                        title: '监管局',
                        width: 190,
                        key: 'supervisionName',
                        align: 'center'
                    },{
                        title: '航空器状态',
                        width: 150,
                        key: 'aircraftStatus',
                        align: 'center'
                    },

                    {
                        title: '操作',
                        width:126,
                        key: 'action',
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [
                            //     h('Button', {
                            //     props: {
                            //         type: 'primary',
                            //         size: 'small'
                            //     },
                            //     style: {
                            //         marginRight: '4px',
                            //         width: '60px',
                            //         background:'#1ca44d',
                            //         color:'#fff',
                            //         border:'none'
                            //     },
                            //     on: {
                            //         click: () => {
                            //             this.userinfo(params.row)
                            //         }
                            //     }
                            // }, '查看'),
                                h('Button', {
                                    props: {
                                        type: 'primary',
                                        size: 'small'
                                    },
                                    style: {
                                        marginRight: '16px',
                                        marginTop: '4px',
                                        width: '30px',
                                        height:'30px',
                                        background: 'url(../../../../static/images/icon_operate_edit.png) no-repeat',
                                        border:'none'
                                    },
                                    on: {
                                        click: () => {
                                            this.updateCheck(params.row)
                                        }
                                    }
                                }, ),
                                h('Button', {
                                    props: {
                                        type: 'error',
                                        size: 'small'
                                    },
                                    style: {
                                        marginTop: '4px',
                                        width: '30px',
                                        height:'30px',
                                        background: 'url(../../../../static/images/icon_operate_delete.png) no-repeat',
                                        border:'none'
                                    },
                                    on: {
                                        click: () => {
                                            this.confirm(params.row.aircraftId);
                                        }
                                    }
                                })
                            ]);
                        }
                    }
                ],

            }
        },

        components: {
            IForm,
            'word': word,
        },

        created: function (newval) {

            this.init(1);
        },

        methods: {
            notnull(datainfo) {
                if (datainfo == '' || datainfo == null) {
                    alert("空的");
                }
            },
            confirm(index) {
                this.$Modal.confirm({
                    title: '警告框：',
                    content: '<p>确认删除该条记录？</p>',
                    onOk: () => {
                        this.removeCheck(index);

                    },
                    onCancel: () => {

                    }
                });
            },
            init: function (obj) {
                this.getAircraftList(obj);
            },
            //添加框
            add_dialog_show: function () {
                this.$router.push({path: '/addAircraft'});
            }, //修改框
            updateCheck(index) {
                this.$router.push({path: '/addAircraft',query:{aircraft:index}});
            },
            userinfo:function (obj) {
                this.$router.push({path: '/viewAircraft',query:{aircraft:obj}});
            },
            //下载
            down_dialog_show: function () {
                let self = this;
                if(typeof(self.aircraft.aircraftStatus) != "undefined"){
                    var status = self.aircraft.aircraftStatus;
                }else{
                    var status = "";
                }
                /*self.$profile.getProfile().then((profile) => {*/
                let buz = JSON.parse(Cookies.get("profile"));
                    self.$http.LocationHref('/eim/api/aircraft/search/downAircraftExcel', {
                        companyId: buz.buz.companyId,
                        regNumber:self.aircraft.regNumber,
                        aircraftStatus:status,
                    }).then(function (response) {
                    }).catch(function (error) {
                        console.log(error);
                    });

                /*})*/
            },
            //删除
            removeCheck(index) {
                let self = this;
                self.$http.httpDelete('/eim/api/aircraft/'+index, {
                    //id
                }).then(function (response) {
                    alert("删除成功");
                    self.init(self.count);
                }).catch(function (error) {
                    console.log(error);
                });
            },
           pageclick:function (obj) {
               this.count = obj;
                this.getAircraftList(obj);
            },
           getAircraftList:function (obj) {

                let self = this;
               if(typeof(self.aircraft.aircraftStatus) != "undefined"){
                   var status = self.aircraft.aircraftStatus;
               }else{
                   var status = "";
               }
              /* self.$profile.getProfile().then((profile) => {*/
               let buz = JSON.parse(Cookies.get("profile"));
                   self.$http.httpGet('/eim/api/aircraft/search/findAircraftByInfo',{
                       companyId: buz.buz.companyId,
                       regNumber:self.aircraft.regNumber,
                       aircraftStatus:status,
                       pageSize:self.pagesize,
                       currentPage:obj
                   }).then(function (response) {

                       let datainfo = response.data.data;

                       self.aircraftList=datainfo;

                       self.pagecount=response.data.data[0].total;
                   }).catch(function (error) {
                       console.log(error);
                   });
               /*});*/
            },pagesizeclick:function (obj) {

                this.pagesize=obj;
                let self = this;
                if(typeof(self.aircraft.aircraftStatus) != "undefined"){
                    var status = self.aircraft.aircraftStatus;
                }else{
                    var status = "";
                }
               /* self.$profile.getProfile().then((profile) => {*/
                let buz = JSON.parse(Cookies.get("profile"));
                    self.$http.httpGet('/eim/api/aircraft/search/findAircraftByInfo',{
                        companyId: buz.buz.companyId,
                        regNumber:self.aircraft.regNumber,
                        aircraftStatus:status,
                        pageSize:self.pagesize,
                        currentPage:1
                    }).then(function (response) {

                        let datainfo = response.data.data;
                        self.aircraftList=datainfo;
                        self.pagecount=response.data.data[0].total;

                    }).catch(function (error) {
                        console.log(error);
                    });
               /* });*/
            },cancel:function () {

            },reset:function(){
                //console.log("qqqqqqqqqqqqqq"+this.$refs['aircraftRef'].resetField())
                this.$refs['aircraftRef'].resetFields();
            }

        }
    }
</script>

<style scoped>
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
    color: black;
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
</style>