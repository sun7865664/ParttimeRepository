<template>
    <div style="width: 1280px; height: 900px; margin-top: 40px; background:white;">
        <div style="background: #FAFAFA; height: 36px; padding-top: 6px; margin: 22px 0px 3px 0px;padding: 6px 0 0 0;">
            <img src="../../../../static/images/基础资料图标.png" style="float: left;margin: 4px 13px 0px 22px;">
            <span style="font-size: 16px; color: #606265;">信息收发-新建信息</span>
        </div>
        <div style="border: solid 1px #DCDFE6; bottom: 0px;top: 76px;width: 965px; right: 26px; padding: 32px 0 0 46px; margin-left: 40px">
            <div class="left" style="height: 700px;width:56px;float: left;">
                <div style="width: 100%;margin-bottom: 15px;height: 30px;color: black;font-size: 14px;padding-top: 3px;">
                    <span style="color: red">*</span><span>标&nbsp;&nbsp;&nbsp;题:</span>
                </div>
                <div style="color: black;font-size: 14px;">
                    <span style="color: red">*</span><span>内&nbsp;&nbsp;&nbsp;容:</span>
                </div>
                <div style="width:100%;margin-top: 327px;color: black;font-size: 14px;height: 30px ">
                    <span style="color: red">*</span><span >接受方:</span>
                </div>
                <div style="width:100%;margin-top: 20px;color: black;font-size: 14px;height: 30px ">
                    &nbsp;<span >附&nbsp;&nbsp;&nbsp;件:</span>
                </div>
            </div>
    <div class="right" style="width: 815px;float: left">
        <input v-model="title" style="width:100%; border: #DCDFE6 1px solid; margin-bottom: 15px; height: 30px; color: #606265;"/>
         <ue :config=config :id=id ref="uedit"></ue>

        <div><input v-model="targetKeys1" disabled="disabled" style="width: 709px;margin-bottom: 15px;height: 30px;margin-top: 14px; margin-right: 5px;color: #606265;"/>
            <a data-v-942377fa="" href="javascript:;" class="look" @click="getrecivicer">查找</a></div>
        <div >
            <uploadfile :uploadList=handbookfilelist v-on:gacomplistenTochildEvent="getuploadListcomp"></uploadfile>
        </div>
    </div>
    <div class="func" style="text-align: center;">
        <a data-v-942377fa="" href="javascript:;" class="look" @click="save" style="padding-left: 0px; margin-bottom: 30px">提交</a>
       </div>
        <Modal
                v-model="modal1"
                title="可选企业"
                @on-ok="oks('formCustom')"
                @on-cancel="cancel">
        </Modal>
        <Modal  v-model="modal3" title="选择接受员工类型" >
        <Transfer
                    :data="data1"
                    :target-keys="targetKeys1"
                    :render-format="render1"
                    :list-style="{height:'220px',background:'rgba(193, 220, 248, 0.5)'}"
                    @on-change="handleChange1"></Transfer>
        </Modal>

        <Modal  v-model="modal2" title="可选员工">
            <div >
                <div class="changetype" style="height: 40px;padding-top: 10px;">
                    <a style=" margin-right: 50px; color: #e9e9e9;:active"  @click="getData1('机务人员')">
                        机务人员
                    </a>
                    <a style=" margin-right: 50px;color: #e9e9e9;" @click="getData1('航务人员')">
                        航务人员
                    </a>
                    <a style=" margin-right: 50px;color: #e9e9e9;" @click="getData">
                        飞行人员
                    </a>
                    <a style="color: #e9e9e9;" @click="getData1('其他人员')">
                        其他人员
                    </a>
                </div>
                <div class=""style="">
                    <ui>
                        <li v-for="employee in employees" style="padding-top: 9px;padding-bottom: 9px;list-style-type:none" @click="">

                            <div  v-if="changecheched(employee.id)"  style="margin-left: 10px">{{ employee.userName }}  <button  @click="showrecivier(employee.id,employee.userName)" type="button" style="float: right;width: 60px; background: black;">已选中</button> </div>
                            <div  v-else style="margin-left: 10px">{{ employee.userName }}  <button  @click="showrecivier(employee.id,employee.userName)" type="button" style="float: right;width: 60px; background: linear-gradient(#a3a3a3, #e7e7e7);">请选择</button> </div>
                        </li>
                    </ui>
                </div>
            </div>
        </Modal>
    </div>
    </div>
</template>
<script>
import ue from '../../ext/ue/ue.vue';
import uploadfile from './uploadfile.vue';
export default {
    components: {
        ue,
        'uploadfile': uploadfile,

    },
    data() {
        return {
            data1: this.getMockData(),
            targetKeys1: this.getTargetKeys(),
            handbookfilelist:[],
            type:[],
            modal3:false,
            attachurl:'',
            title:'',
            reciverid:[],
            recivername:[],
            page:1,
            pageSize:10,
            keyword:'',
            employees:[],
            modal1: false,
            modal2: false,
            id: 'document',
            config: {
                UEDITOR_HOME_URL: '/static/UE/',
                initialFrameHeight: 200
//                themePath:'static/UE/themes/'
            }
        }
    },
    methods: {
        getMockData () {
            let mockData = [];

                mockData.push({
                    key: "机务人员",
                    label: '机务人员',
                    description: 'The desc of content  '

                });
            mockData.push({
                key: "航务人员",
                label: '航务人员',
                description: 'The desc of content  '

            });
            mockData.push({
                key: "飞行人员",
                label: '飞行人员',
                description: 'The desc of content  '

            });
            mockData.push({
                key: "其他人员",
                label: '其他 人员',
                description: 'The desc of content  '

            });

            return mockData;
        },
        getTargetKeys () {
//            return this.getMockData()
//                .filter(() => Math.random() * 2 > 1)
//                .map(item => item.key);
        },
        render1 (item) {
            return item.label;
        },
        handleChange1 (newTargetKeys, direction, moveKeys) {
            console.log(newTargetKeys);
            console.log(direction);
            console.log(moveKeys);
            this.targetKeys1 = newTargetKeys;
        },
        save(){
            let self=this;
            let handbookFile = JSON.stringify(self.handbookfilelist);
            if(self.title) {
                self.title=self.title.replace(/(^\s*)|(\s*$)/g, "");
            }else{
                alert("标题不能为空")
                return
            }
            let Content=self.$refs.uedit.getUEContent();
            if(Content) {
                Content=Content.replace(/(^\s*)|(\s*$)/g, "");
            }else{
                alert("内容不能为空")
                return
            }
            let readers=JSON.stringify(self.targetKeys1);
            if(readers) {
                readers=readers.replace(/(^\s*)|(\s*$)/g, "");
            }else{
                alert("收件人不能为空")
                return
            }

            this.$profile.getProfile().then((profile) => {
            self.$http.httpPost('/app/api/doclist', {
                title:self.title,
                content:Content,
                filepath:handbookFile,
                creator:profile.buz.employeeId

            }).then((res) => {
                 console.log(res)
                self.$http.httpPost('/app/api/docreader', {
                    docid: res.data.id,
                    readertype:readers,
                    reader:profile.buz.companyId,
                }).then((res) => {
                    alert("保存成功");
                    this.$router.push({path: '/documentlist',query:{defalg:1}});
                })
            })
                },
                (error) => {
                    self.$Message.error('user profile error = ' + error);
                });
        },
        getuploadListcomp(val){
            this.handbookfilelist=val;
        },
        handleSuccess (res, file) {
            //{"data":["/upload/avatar/0????.jpg"],"resultCode":200}
            if (res.resultCode == 200) {
                let tempurl=res.url;
                if(this.attachurl.length==0){
                    this.attachurl = tempurl;
                }else{
                    this.attachurl=this.attachurl+","+  tempurl
                }

                console.log(this.attachurl);

            }
        },
        getData1 (jobTitle1) {
            let self = this;
            self.employees=[];
            self.$profile.getProfile().then((profile) => {
                self.$http.httpGet('/app/api/employee/search/findEmployeeByjobtitleAndcompanyId', {
                    companyId: profile.buz.companyId,
                    page: self.page,
                    pageSize: self.pageSize,
                    keyword:self.keyword,
                    jobTitle:jobTitle1
                }).then((res) => {
                    let result = res.data;
                    if (result.resultCode == 200) {
                        let temp = result.data;
                        if (temp && temp.length > 0) {
                            for (var i = 0; i < temp.length; i++) {
                                self.employees.push({'userName': temp[i].userName, 'id': temp[i].employeeId});

                            }

                        }else {
                            this.$message('已是最后一页');
                        }
                        // self.pageSize = 2;
                        // self.page = ;
                        // console.log('总记录数 : ' + result.data.totalElements);
                        // console.log('总页数 : ' + result.data.totalPages);
                        // console.log('当前页 : ' + (result.data.number + 1));
                        // console.log('页记录数 : ' + result.data.size);

                    }
                    else {
                        console.log(result.message)
                    }
                })
                self.$http.httpGet('/app/api/employee/search/findcountEmployeeByjobtitleAndcompanyId', {
                    companyId: profile.buz.companyId,
                    page: self.page,
                    pageSize: self.pageSize,
                    keyword:self.keyword,
                    jobTitle:jobTitle1
                }).then((res) => {
                    let result = res.data;
                    if (result.resultCode == 200) {
                        let pagecount = result.data;
                        if(pagecount<self.pageSize||pagecount==self.pageSize){
                            self.pagetatel=1;
                        }else{
                            self.pagetatel=parseInt(pagecount/self.pageSize)+1
                        }
                    }
                    else {
                        console.log(result.message)
                    }
                })
            }, (error) => {
                console.log('error', error);
            });

        },
        getrecivicer() {
            let self = this;
            self.employees=[];

            self.$profile.getProfile().then((profile) => {
              let roles =profile.roles;

              if(roles[0]==="operation_thqycy"||roles[0]==="operation_role_company_admin"){
                  self.modal3=true;


              }

            }, (error) => {
                console.log('error', error);
            });
        },
        getData () {
            let self = this;
            self.employees=[];
            self.$profile.getProfile().then((profile) => {
                self.$http.httpGet('/app/api/pilot/search/company', {
                    companyId: profile.buz.companyId,
                    page: self.page,
                    pageSize: self.pageSize,
                    keyword:self.keyword,
                    jobTitle:"飞行人员"
                }).then((res) => {
                    let result = res.data;
                    if (result.resultCode == 200) {
                        let temp = result.data;
                        console.log(temp.length)
                        if (temp && temp.length > 0) {
                            for(var i=0;i<temp.length;i++){
                                self.employees.push({'userName':temp[i].username,'id':temp[i].employeeId});

                            }

                        }else {
                            this.$message('已是最后一页');
                        }
                        // self.pageSize = 2;
                        // self.page = ;
                        // console.log('总记录数 : ' + result.data.totalElements);
                        // console.log('总页数 : ' + result.data.totalPages);
                        // console.log('当前页 : ' + (result.data.number + 1));
                        // console.log('页记录数 : ' + result.data.size);
                    }
                    else {
                        console.log(result.message)
                    }
                })
                self.$http.httpGet('/app/api/pilot/search/companyPilotcountBycompanyId', {
                    companyId: profile.buz.companyId,
                    page: self.page,
                    pageSize: self.pageSize,
                    keyword:self.keyword,
                    jobTitle:val
                }).then((res) => {
                    let result = res.data;
                    if (result.resultCode == 200) {
                        let pagecount = result.data;
                        if(pagecount<self.pageSize||pagecount==self.pageSize){
                            self.pagetatel=1;
                        }else{
                            self.pagetatel=parseInt(pagecount/self.pageSize)+1
                        }
                    }
                    else {
                        console.log(result.message)
                    }
                })
            }, (error) => {
                console.log('error', error);
            });

        },
        showrecivier(valid,valname){

            var el = event.currentTarget;

           if(this.changecheched(valid)){
               for (var i = 0; i < this.reciverid.length; i++){
                   if (this.reciverid[i] === valid) {
                       this.reciverid.splice(i, 1);
                       this.recivername.splice(i, 1);
                       el.outerHtml="<button  @click=\"showrecivier(employee.id,employee.userName)\" type=\"button\" style=\"float: right;width: 60px; background: linear-gradient(#a3a3a3, #e7e7e7);\">请选择</button> "

                   }
               }
           }else{

               this.reciverid.push(valid);

               this.recivername.push(valname);


           }




        },
        changecheched(id){
            if(this.reciverid.length==0){
                return false
            }
            else{
                for(var i=0;i<this.reciverid.length;i++){
                    if(id===this.reciverid[i]){
                        return true
                    }
                }
            }
        },
        refrush(){
            history.go(0);
        }
    },
    watch:{
        reciverid: {
            handler(newValue, oldValue) {
                for (let i = 0; i < newValue.length; i++) {
                    if (oldValue[i] != newValue[i]) {

                        console.log(newValue)
                    }
                }
            },
            deep: true
        }

    }
}
</script>
<style>
    .look {
        padding-left: 30px;
        font-size: 14px;
        display: inline-block;
        width: 97px;
        height: 30px;
        line-height: 30px;
        border: 1px solid #2b82da;
        border-radius: 3px;
        color: #606265;
        background: #DDF4FF;
    }
    .look a:hover {
        padding-left: 30px;
        display: inline-block;
        width: 12%;
        height: 30px;
        line-height: 30px;
        border: 1px solid #ececec;
        border-radius: 3px;
        color: black;
        background: rgba(37,128,221,1);
        background: rgba(37,128,221,1);
    }
    .changetype >a:active{
        color:#D200D2;
    }
    .ivu-transfer{
        padding-left: 27px;
    }
    .ivu-transfer-list{
        margin-top: 5px;
        margin-bottom: 5px;
        border:none !important;
    }
    .ivu-transfer-list-content-item{
        color: black;
        margin-top: 5px;
        margin-bottom: 5px;
    }
    .ivu-modal-body {
        padding-top: 0px !important;
        padding-bottom: 0px !important;
        font-size: 14px !important;
        line-height: 1.5 !important;
        color: #e9e9e9 !important;
        background-color: rgba(193, 220, 248, 0.5) !important;
    }
</style>