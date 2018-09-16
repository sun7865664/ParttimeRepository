<template>
  <div style="width: 1280px; height: 900px; margin-top:30px; background:white">
        <div>
          <span style="width:100%; display:inline-block;text-align:right;">
                    <Button type="primary" @click="modalshow('equipmentvalidate')" icon="plus" style="width: 98px;height: 32px;margin:24px 43px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">增  加</Button>
          </span>
          <div class="bottom5" style="margin-right: 43px; margin-left: 43px">
            <Table border :columns="columns7" :data="equipmentList"></Table>
          </div>
          <Page :total="pagecount" @on-change="pageclick" @on-page-size-change="pagesizeclick" :page-size="pagesize" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
        </div>
      <Modal v-model="add_dialog_show" width="400" title="新增机载设备" @on-ok="submitCheckForm"
             @on-cancel="dealcancel" :styles="{top: '20px'}">
          <Form :label-width="100" :model="check_form" :rules="rule" ref="equipmentvalidate">
                          <FormItem label="设备类型" class="bottom5" prop="epType">
                              <Select v-model="check_form.epType" placeholder="请选择" style="width: 90%;">
                                  <Option value="应答机">应答机</Option>
                                  <Option value="ADS-B">ADS-B</Option>
                                  <Option value="北斗">北斗</Option>
                                  <Option value="4-3G/4G终端卡号">4-3G/4G终端卡号</Option>
                              </Select>
                          </FormItem>

                          <FormItem label="设备号" class="bottom5" prop="epNum">
                              <Input v-model="check_form.epNum"  placeholder="请输入设备号..." style="width: 90%;"></Input>
                          </FormItem>

                          <FormItem label="航空器注册号" class="bottom5" prop="regNumber">
                              <Select v-model="check_form.regNumber" placeholder="请选择" style="width: 90%;">
                                  <Option v-for="site in supervision1" :key="site.regNumber" :value="site.regNumber">{{ site.regNumber }}</Option>
                              </Select>
                          </FormItem>
          </Form>
      </Modal>
  </div>


</template>

<script>
    import Cookies from 'js-cookie';

    export default {
        data() {
            return {
                rule:{
                    epNum:[{required:true, message: '设备类型不能为空', trigger: 'blur'}],
                    epType:[{required:true,message:'设备号不能为空',trigger:'change'}],
                },
                supervision1:[],
                add_dialog_show: false,
                pagesize:10,
                pagecount:1,
                count:1,
                check_form: {
                    id:'',
                    epType:'',
                    epNum:'',
                    regNumber:'',
                    companyId:''
                },
                equipmentList: [],
                isflg:'',
                columns7: [
                    {
                        title: '设备类型',
                        width: 270,
                        key: 'epType',
                        align: 'center'
                    },{
                        title: '设备号',
                        key: 'epNum',
                        align: 'center',
                        width: 240
                    },
                    {
                        title: '所属航空器注册号',
                        width: 240,
                        key: 'regNumber',
                        align: 'center'
                    },
                    {
                        title: '所属企业',
                        width: 320,
                        key: 'companyName',
                        align: 'center'
                    },
                    {
                        title: '操作',
                        width:120,
                        key: 'action',
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [h('Button', {
                                    props: {
                                        type: 'primary',
                                        size: 'small'
                                    },
                                    style: {
                                        marginRight: '10px',
                                        marginTop: '4px',
                                        width: '30px',
                                        height:'30px',
                                        background: 'url(../../../../static/images/icon_operate_edit.png) no-repeat',
                                        border:'none'
                                    },
                                    on: {
                                        click: () => {
                                            this.updateCheck(params.index)
                                        }
                                    }
                                }),
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
                                            this.confirm(params.row.id);
                                        }
                                    }
                                })
                            ]);
                        }
                    }
                ]

            }
        },
        created: function (newval) {
            let self = this;

            let buz = JSON.parse(Cookies.get("profile"));
            alert(buz);
                self.$http.httpGet('/eim/api/aircraft/search/findByCompanyId', {
                    companyId:buz.buz.companyId

                }).then(function (response) {
                    let datainfo = response.data.data;

                    self.supervision1 = datainfo;

                }).catch(function (error) {
                    console.log(error);
                });

            self.init(1);
        },

        methods: {
            dealcancel(){
                this.add_dialog_show = false;
                this.check_form = {};
                this.init(1);
            },
            modalshow(val){
                this.isflg='1';
                this.$refs[val].resetFields();
                this.add_dialog_show = true
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
            /*//添加框
            add_dialog_show: function () {
                this.$router.push({path: '/addAircraft'});
            },*/
            saveSubmit(){
                let self = this;
                let buz = JSON.parse(Cookies.get("profile"));
                    self.check_form.companyId = buz.buz.companyId

                    self.$http.jsonPost('/eim/api/equipment',self.check_form).then(function (res) {
                        let result = res.data;
                        console.log("result", result.resultCode)
                        if (result.resultCode == 200) {
                            self.check_form = {};
                            self.init(self.count);
                        }
                    }).catch(function (error) {
                        console.log(error);
                    });
                    alert("保存成功");

            },
            submitCheckForm() {

                this.$refs.equipmentvalidate.validate((valid) => {
                    let self = this;
                    if (valid) {
                        let buz = JSON.parse(Cookies.get("profile"));
                        if(self.isflg=='1'){

                                self.$http.httpGet('/eim/api/equipment/search/findEquipmentbyepNum', {
                                    epNum: self.check_form.epNum,
                                    companyId:buz.buz.companyId
                                }).then(function (response) {
                                    let result = response.data.data;
                                    if (result != null && result != '') {
                                        alert("设备已存在，不能重复添加");
                                    } else {
                                        self.saveSubmit();
                                    }
                                })
                                    .catch(function (error) {
                                        console.log(error);
                                        self.$emit('childshow', '1');
                                    });

                        }else{

                                self.$http.httpGet('/eim/api/equipment/search/findEquipmentbyepNums', {
                                    epNum: self.check_form.epNum,
                                    id: self.check_form.id,
                                    companyId: buz.buz.companyId
                                }).then(function (response) {
                                    let result = response.data.data;
                                    if (result != null && result != '') {
                                        alert("设备已存在，不能重复添加");
                                        self.init(self.count);
                                    } else {
                                        self.saveSubmit();
                                    }
                                })
                                    .catch(function (error) {
                                        console.log(error);
                                        self.$emit('childshow', '1');
                                    });

                        }

                    }
                    else {
                       // self.getPhysicalrecords(self.employeeId);
                        this.$Message.error('表单验证失败!红星为必填');
                        return;
                    }

                })
            },
            //修改框
            /*updateCheck(index) {
                this.$router.push({path: '/addAircraft',query:{aircraft:index}});
            },*/
        updateCheck(index) {
            this.isflg='2';
            this.$refs['equipmentvalidate'].resetFields();
            this.check_form = this.equipmentList[index];
            this.add_dialog_show = true;
        },
            //删除
            removeCheck(index) {
                let self = this;
                self.$http.httpDelete('/eim/api/equipment/one/'+index, {
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
               let buz = JSON.parse(Cookies.get("profile"));
                   self.$http.httpGet('/eim/api/equipment/search/findByCompany',{
                       companyId:buz.buz.companyId,
                       pageSize:self.pagesize,
                       currentPage:obj
                   }).then(function (response) {

                       let datainfo = response.data.content;

                       self.equipmentList=datainfo;
                       self.pagecount=response.data.totalElements;
                   }).catch(function (error) {
                       console.log(error);
                   });

            },pagesizeclick:function (obj) {

                this.pagesize=obj;
                let self = this;

                let buz = JSON.parse(Cookies.get("profile"));
                    self.$http.httpGet('/eim/api/equipment/search/findByCompany',{
                        companyId: buz.buz.companyId,

                        pageSize:self.pagesize,
                        currentPage:1
                    }).then(function (response) {

                        let datainfo = response.data.content;
                        self.equipmentList=datainfo;
                        self.pagecount=response.data.totalElements;

                    }).catch(function (error) {
                        console.log(error);
                    });

            },cancel:function () {

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