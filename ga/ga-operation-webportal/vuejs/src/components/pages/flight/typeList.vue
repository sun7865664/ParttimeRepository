<template>
  <div style="width: 1280px; height: 900px; margin-top: 30px; background:white">
    <Form :model="formItem" :label-width="100" style="padding: 28px 0 0 0;">
      <FormItem label="机型编号" style="width:267px;float: left;">
        <Input v-model="formItem.typeNumber" placeholder="请输入编号"></Input>
      </FormItem>
      <!--<FormItem label="人员类型" style="width:267px;float: left;margin-left: 8px;">
          <Input v-model="formItem.jobTitle" placeholder="请输入帐号"></Input>
      </FormItem>-->

      <FormItem label="机型名称" style="width:267px;float: left;">
        <Input v-model="formItem.typeName" placeholder="请输入名称"></Input>
      </FormItem>
      <FormItem  style="width:100px;height: 20px; float: left; margin-left: -32px;">
        <Button type="primary" @click="reset">查询</Button>
      </FormItem>
      <FormItem  style="width:100px;height: 20px; float: left; margin-left: -32px;">
        <Button type="primary" @click="cancel">重置</Button>
      </FormItem>
    </Form>
    <div>
      <div>
        <span style="width:100%; display:inline-block;text-align:right; margin-top: -30px">
            <Button type="primary" @click="addPage()" icon="plus" style="width: 98px;height: 32px;margin:24px 43px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">增  加</Button>
        </span>

        <div class="bottom5" style="margin-right: 43px; margin-left: 43px">
          <Table border :columns="columns7" :data="typeList" @on-row-dblclick="viewPage"></Table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
    import Cookies from 'js-cookie';
    export default {
        data() {
            return {
                modal2:false,
                formItem: {
                    typeNumber: '',
                    typeName: '',
                },
                modal1: false,
                typeList: [],
                id:-1,
                columns7: [
                    {
                        title: '机型编号',
                        key: 'typeNumber',
                        align: 'center',
                        width: 140
                    },
                    {
                        title: '机型名称',
                        width: 210,
                        key: 'typeName',
                        align: 'center'
                    },
                    {
                        title: '航空器类型',
                        width: 180,
                        key: 'aircraftType',
                        align: 'center'
                    },
                    {
                        title: '航空器级别',
                        width: 150,
                        key: 'aircraftLevel',
                        align: 'center'
                    },{
                        title: '航空器型别',
                        width: 200,
                        key: 'aircraftModel',
                        align: 'center'
                    },{
                        title: '制造厂家',
                        width: 180,
                        key: 'manufacturer',
                        align: 'center'
                    },

                    {
                        title: '操作',
                        width: 127,
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
                            //         border:'none',
                            //         color: '#fff'
                            //     },
                            //     on: {
                            //         click: () => {
                            //             this.viewPage(params.row.id)
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
                                            this.editPage(params.row.id)
                                        }
                                    }
                                }),
                                h('Button', {
                                    props: {
                                        type: 'error',
                                        size: 'small',
                                    },
                                    style: {
                                        marginRight: '12px',
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

        },
        props: ['jobTitle'],
        created: function (newval) {

            this.init();
        },
        watch: {
            jobTitle:function (newvals) {

                let self = this;
                self.formItem.jobTitle = newvals;
            }
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
                        this.deleteType(index);
                    },
                    onCancel: () => {

                    }
                });
            },
            init: function () {
                this.getTypeList(1);
            },
            //添加框
            addPage: function () {
                this.$router.push({path: '/addType'});
            },
            //修改
            editPage(id) {
                this.$router.push({path: '/editType',query:{id:id}});
            },
            //查看详情
            viewPage(type) {
                this.$router.push({path: '/viewType',query:{id:type.id}});
            },
            //删除
            deleteType(id) {
                let self = this;
                self.$http.httpDelete('/eim/api/plantype/delete/'+ id, {
                    //id
                }).then(function (response) {
                    alert("删除成功");
                    self.init();
                }).catch(function (error) {
                    console.log(error);
                });
            },
            getTypeList:function (obj) {
                let self = this;
                /*self.$profile.getProfile().then((profile) => {*/
                let buz = JSON.parse(Cookies.get("profile"));
                    self.$http.httpGet('/eim/api/plantype',{

                    }).then(function (response) {
                        console.info(response);
                        let datainfo = response.data.data;
                        self.typeList=datainfo;
                    }).catch(function (error) {
                        console.log(error);
                    });
               /* });*/
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