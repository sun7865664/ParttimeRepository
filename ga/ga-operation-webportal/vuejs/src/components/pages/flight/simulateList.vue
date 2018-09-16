<template>
  <div style="width: 1280px; height: 900px; margin-top: 30px; background:white">

    <Form :model="formItem" :label-width="100" style="padding: 28px 0 0 0;" ref="simRef">
      <FormItem label="名称" style="width:267px;float: left;" prop="name">
        <Input v-model="formItem.name" placeholder="请输入名称"></Input>
      </FormItem>
      <!--<FormItem label="人员类型" style="width:267px;float: left;margin-left: 8px;">
          <Input v-model="formItem.jobTitle" placeholder="请输入帐号"></Input>
      </FormItem>-->

      <FormItem label="类型" style="width:267px;float: left;" prop="type">
        <Select v-model="formItem.type" placeholder="请选择" style="width: 90%;">
          <Option value="飞行训练器">飞行训练器</Option>
          <Option value="飞行模拟器">飞行模拟器</Option>
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
        <span style="width:100%; display:inline-block;text-align:right; margin-top: -30px">
            <Button type="primary" @click="add_dialog_show()" icon="plus" style="width: 98px;height: 32px;margin:24px 43px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">增  加</Button>
          <Button type="primary" @click="down_dialog_show()" icon="plus" style="width: 98px;height: 32px;margin:24px 43px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">导 出</Button>
        </span>

        <div class="bottom5" style="margin-right: 43px; margin-left: 43px">
          <Table border :columns="columns7" :data="simulateList" @on-row-dblclick="viewSimulate"></Table>
        </div>
        <Page :total="pagecount" @on-change="pageclick" @on-page-size-change="pagesizeclick" :page-size="pageSize" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
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
                count:1,
                modal2:false,
                pagecount:1,
                formItem: {
                    name: '',
                    type: '',
                },
                modal1: false,
                page:0,
                pageSize: 10,
                totalPages:1,
                simulateList: [],
                columns7: [
                    {
                        title: '设备名称',
                        key: 'equipmentName',
                        align: 'center',
                        width: 220
                    },
                    {
                        title: '设备类型',
                        width: 190,
                        key: 'equipmentType',
                        align: 'center'
                    },
                    {
                        title: '设备型号',
                        width: 190,
                        key: 'equipmentModel',
                        align: 'center'
                    },
                    {
                        title: '所属企业',
                        width: 290,
                        key: 'companyName',
                        align: 'center'
                    },
                    {
                        title: '设备状态',
                        width: 182,
                        key: 'equipmentStatus',
                        align: 'center'
                    },

                    {
                        title: '操作',
                        width: 120,
                        key: 'action',
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [ /*h('Button', {
                                props: {
                                    type: 'primary',
                                    size: 'small'
                                },
                                style: {
                                    marginRight: '4px',
                                    width: '60px',
                                    background:'#1ca44d',
                                    border:'none',
                                    color:"#fff"
                                },
                                on: {
                                    click: () => {
                                        this.viewSimulate(params.row)
                                    }
                                }
                            }, '查看'),*/
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
                                            this.editSimulate(params.row.id)
                                        }
                                    }
                                }),
                                h('Button', {
                                    props: {
                                        type: 'error',
                                        size: 'small'
                                    },
                                    style: {
                                        marginLeft: '4px',
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
                ],

            }
        },

        components: {
            IForm,
            'word': word,
        },
        props: ['jobTitle'],
        created: function () {
            this.init(1);
        },
        watch: {

        },
        methods: {
            notnull(datainfo) {
                if (datainfo == '' || datainfo == null) {
                    alert("空的");
                }
            },
            confirm(id) {
                this.$Modal.confirm({
                    title: '警告框：',
                    content: '<p>确认删除该条记录？</p>',
                    onOk: () => {
                        this.deleteSimulate(id);
                    },
                    onCancel: () => {

                    }
                });
            },
            init: function (obj) {
                this.getSimulateList(obj);
            },
            //添加
            add_dialog_show: function () {
                this.$router.push({path: '/addSimulate',query:{ }});
            },
            //修改
            editSimulate(id) {
                this.$router.push({path: '/editSimulate',query:{id:id}});
            },
            viewSimulate(obj) {
                this.$router.push({path: '/viewSimulate',query:{simulate:obj}});
            },
            //下载
            down_dialog_show: function () {
                let self = this;
               /* self.$profile.getProfile().then((profile) => {*/
                let buz = JSON.parse(Cookies.get("profile"));
                    self.$http.LocationHref('/eim/api/simulate/export/companyid', {
                        companyId: buz.buz.companyId,
                        name: this.formItem.name,
                        type: this.formItem.type,
                    }).then(function (response) {
                    }).catch(function (error) {
                        console.log(error);
                    });

              /*  })*/
            },
            //删除
            deleteSimulate(id) {
                let self = this;
                self.$http.httpDelete('/eim/api/simulate/'+id, {
                    //id
                }).then(function (response) {
                    alert("删除成功");
                    self.init(self.count);
                }).catch(function (error) {
                    console.log(error);
                });
            },
            cancelform: function (item) {
                this.formValidate.orgs.splice(this.formValidate.orgs.indexOf(item), 1);
            },pageclick:function (obj) {
                this.count = obj;
                this.getSimulateList(obj);
            },getSimulateList:function (obj) {
                let self = this;
                /*self.$profile.getProfile().then((profile) => {*/
                let buz = JSON.parse(Cookies.get("profile"));
                    console.info(buz.buz.companyId);
                    self.$http.httpGet('/eim/api/simulate/getListByPage',{
                        companyId: buz.buz.companyId,
                        name: this.formItem.name,
                        type: this.formItem.type,
                        currentPage:obj,
                        pageSize: self.pageSize
                    }).then(function (response) {
                        let datainfo = response.data.content;

                        self.simulateList=datainfo;
                        console.log("sssssssssss"+response.data.totalElements)
                        self.pagecount=response.data.totalElements;


                    }).catch(function (error) {
                        console.log(error);
                    });
               /* });*/
            },pagesizeclick:function (obj) {
                this.pageSize=obj;
                let self = this;
                /*self.$profile.getProfile().then((profile) => {*/
                let buz = JSON.parse(Cookies.get("profile"));
                    self.$http.httpGet('/eim/api/simulate/getListByPage',{
                        companyId: buz.buz.companyId,
                        name: this.formItem.name,
                        type: this.formItem.type,
                        pageSize:self.pageSize,
                        currentPage:1
                    }).then(function (response) {
                        let datainfo = response.data.content;
                        self.simulateList=datainfo;
                        self.pagecount=response.data.totalElements;

                    }).catch(function (error) {
                        console.log(error);
                    });
               /* });*/
            },cancel:function () {

            },reset:function(){
                //console.log("qqqqqqqqqqqqqq"+this.$refs['aircraftRef'].resetField())
                this.$refs['simRef'].resetFields();
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