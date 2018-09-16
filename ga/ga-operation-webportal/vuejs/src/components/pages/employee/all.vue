<template>
    <div style="width: 1280px; height: 900px; margin-top:30px; background:white">

        <Form ref="formItem" :model="formItem" :label-width="100" style="padding: 28px 0 0 0;">
            <FormItem label="姓名" style="width:267px;float: left;margin-left: 0px;">
                <Input v-model="formItem.userName" placeholder="请输入姓名"></Input>
            </FormItem>
            <FormItem label="运行基地" style="width:267px;float: left;margin-left: 0px;">
                <Select v-model="formItem.baseId" number="true"  placeholder="请选择">
                    <Option v-for="site in supervision" :key="site.baseId" :value="site.baseId">{{ site.baseName }}</Option>
                </Select>
            </FormItem>

            <FormItem label="职位" style="width:267px;float: left;margin-left: 0px;">
                <Input v-model="formItem.techpos" placeholder="请输入职位"></Input>
            </FormItem>
            <FormItem label="手机号码" style="width:267px;float: left;margin-left: 0px;">
                <Input v-model="formItem.homeMobile" placeholder="请输入手机号码"></Input>
            </FormItem>

            <FormItem  style="width:100px; height: 20px; float: left; margin-left: -56px;">
                <Button type="primary" @click="init(1)">查询</Button>
            </FormItem>
            <FormItem  style="width:100px;height: 20px; float: left; margin-left: -32px;">
                <Button type="primary" @click="reset">重置</Button>
            </FormItem>
        </Form>
        <div>
            <div>
                <span style="width:100%; display:inline-block;text-align:right; margin-top: -30px">
                    <Button type="primary" @click="add_dialog_show()" icon="plus" style="width: 98px;height: 32px;margin:24px 12px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">增  加</Button>
                    <Button type="primary" @click="down_dialog_show()" icon="plus" style="width: 98px;height: 32px;margin:24px 42px 11px 0px;border: 1px dashed #2b82da;background: #DDF4FF;font-size: 14px;color: #2FA5FB;" size="small">导 出</Button>
                </span>

                <div class="bottom5" style="margin-right: 43px; margin-left: 43px">
                    <Table border :columns="columns7" :data="users" @on-row-dblclick="userinfo"></Table>
                </div>
                <Page :total="pagecount" @on-change="pageclick" @on-page-size-change="pagesizeclick" :page-size="pagesize" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
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
                supervision:[],
                user:{},
                jobTitle: '',
                formItem: {
                    userName: '',
                    baseId:'',
                    techpos: '',
                    homeMobile: ''
                },
                users: [],
                pagesize:10,
                pagecount:0,
                count:1,
                columns7: [
                    {
                        title: '姓名',
                        key: 'userName',
                        align: 'center',
                        width: 160
                    },
                    {
                        title: '身份证号',
                        width: 200,
                        key: 'cardId',
                        align: 'center'
                    },
                    {
                        title: '人员类型',
                        width: 160,
                        key: 'jobTitle',
                        align: 'center'
                    },
                    {
                        title: '工作单位',
                        width: 210,
                        key: 'companyName',
                        align: 'center'
                    },{
                        title: '职位',
                        width: 192,
                        key: 'techpos',
                        align: 'center'
                    },{
                        title: '手机号码',
                        width: 150,
                        key: 'homeMobile',
                        align: 'center'
                    },
                    {
                        title: '操作',
                        width: 120,
                        key: 'action',
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [
            /*                 h('Button', {
                                props: {
                                    type: 'primary',
                                    size: 'small'
                                },
                                style: {
                                    marginRight: '4px',
                                    width: '40px',
                                    height:'40px',
                                    background: 'url(../../../../static/images/icon_operate_edit.png) no-repeat',
                                    border:'none'
                                },
                                on: {
                                    click: () => {
                                        this.userinfo(params.row)
                                    }
                                }
                            }),*/
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
                                            this.confirm(params.row.employeeId);
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
        created: function (newval) {
            let self = this;
           /* self.$profile.getProfile().then((profile) => {
            self.$http.httpGet('/eim/api/operation/search/bycompanyid', {
                companyId: profile.buz.companyId,
            }).then(function (response) {
                let datainfo=response.data;
                self.supervision=datainfo;
            }) .catch(function (error) {
                console.log(error);
            });
            });*/
            this.init(1);

        },
        watch: {
            jobTitle:function (newvals) {

                let self = this;
              self.jobTitle = newvals;
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
                        this.removeCheck(index);

                    },
                    onCancel: () => {

                    }
                });
            },
            init: function (obj) {
                this.searchuser(obj);

            },
            //添加框
            add_dialog_show: function () {
                this.$router.push({path: '/adduser',query:{userfalg:1}});
            },
            //下载
            down_dialog_show: function () {
                let self = this;
                if(typeof(self.formItem.baseId) != "undefined"){
                    var bes = self.formItem.baseId;
                }else{
                    var bes = "";
                }
                self.$profile.getProfile().then((profile) => {
                    self.$http.LocationHref('/eim/api/employee/search/downEmployeeExcel', {
                        companyId: profile.buz.companyId,
                        baseId:bes,
                        userName:self.formItem.userName,
                        jobTitle:self.jobTitle,
                        techpos:self.formItem.techpos,
                        homeMobile:self.formItem.homeMobile
                    }).then(function (response) {
                    }).catch(function (error) {
                        console.log(error);
                    });

                })
               /* let self = this;
                self.$profile.getProfile().then((profile) => {
                self.$http.httpGet('/app/api/employee/search/downEmployeeExcel',{
                    companyId: profile.buz.companyId,
                    userName:self.formItem.userName,
                    jobTitle:self.formItem.jobTitle,
                    techpos:self.formItem.techpos,
                    homeMobile:self.formItem.homeMobile

                }).then(function (response) {
                    alert("导出成功");

                }).catch(function (error) {
                    console.log(error);
                })
                })*/
               },
            //修改框
            /*updateCheck(index) {
                this.$router.push({path: '/editEmployee',query:{userfalg:2,user:index}});
            },*/
            updateCheck(obj) {
                //alert(obj.employeeId);
                //alert(obj.jobTitle);
                let self = this;
                if(obj.jobTitle === '飞行人员'){
                    var id = obj.employeeId;
                    self.$http.httpGet('/eim/api/pilot/search/byEmployeeId', {
                        id,
                    }).then(function (response) {
                        let pilot = response.data.data;
                        //alert(obj.supervisionId);
                        self.$router.push({path: '/editEmployee',query:{employee:obj,pilot:pilot}});
                    }).catch(function (error) {
                        console.log(error);
                    });
                }else if(obj.jobTitle === '管制人员'){
                    var id = obj.employeeId;
                    self.$http.httpGet('/eim/api/controlEmpl/search/byEmployeeId', {
                        id,
                    }).then(function (response) {
                        let control = response.data.data;
                        self.$router.push({path: '/editEmployee',query:{employee:obj,control:control}});
                    }).catch(function (error) {
                        console.log(error);
                    });
                }else {
                    self.$router.push({path: '/editEmployee',query:{employee:obj}});
                }
            },
            //删除
            removeCheck(index) {

                let self = this;
                self.$http.httpDelete('/eim/api/employee/'+index, {
                    //id
                }).then(function (response) {
                    alert("删除成功");
                    self.init(self.count);
                }).catch(function (error) {
                    console.log(error);
                });
            },

            //添加
            submittraining: function () {
                //{ path: '/goods', component: goods }
                const router = new VueRouter();
                console.log(router);
                //this.router.go({name: 'user', params: {userId: 1}});

            },
           pageclick:function (obj) {
                 this.count = obj;
                this.searchuser(obj);
            },searchuser:function (obj) {

                let self = this;
                if(typeof(self.formItem.baseId) != "undefined"){
                    var bes = self.formItem.baseId;
                }else{
                    var bes = "";
                }
               // alert(Cookies.get("profile"));
                let userss = JSON.parse(Cookies.get("userInfo"));
                /*self.$profile.getProfile().then((profile) => {*/
                    self.$http.httpGet('/eim/api/employee/search/findEmployeeByInfo',{
                        companyId: userss.companyId,
                        userName:self.formItem.userName,
                        baseId:bes,
                        jobTitle:self.jobTitle,
                        techpos:self.formItem.techpos,
                        homeMobile:self.formItem.homeMobile,
                        pageSize:self.pagesize,
                        currentPage:obj
                    }).then(function (response) {
                        let datainfo = response.data.data;
                        self.users=datainfo;
                        self.pagecount=response.data.data[0].total;
                    }).catch(function (error) {
                        console.log(error);
                    });
               /* });*/
            },pagesizeclick:function (obj) {

                this.pagesize=obj;
                let self = this;

                if(typeof(self.formItem.baseId) != "undefined"){
                    var bes = self.formItem.baseId;
                }else{
                    var bes = "";
                }
                self.$profile.getProfile().then((profile) => {
                    self.$http.httpGet('/eim/api/employee/search/findEmployeeByInfo',{
                        companyId: profile.buz.companyId,
                        userName:self.formItem.userName,
                        baseId:bes,
                        jobTitle:self.jobTitle,
                        techpos:self.formItem.techpos,
                        homeMobile:self.formItem.homeMobile,
                        pageSize:self.pagesize,
                        currentPage:1
                    }).then(function (response) {

                        let datainfo = response.data.data;
                        self.users=datainfo;
                        self.pagecount=response.data.data[0].total;

                    }).catch(function (error) {
                        console.log(error);
                    });
                });
            },reset:function () {
                this.formItem={
                        userName: '',
                        baseId:'',
                        techpos: '',
                        homeMobile: ''
                }
            },userinfo:function (obj) {
                console.info(obj);
                    this.$router.push({path: '/pilot',query:{user:obj}});
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