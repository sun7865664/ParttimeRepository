<style>
    .fade.in {
        opacity: 1;
    }
    .submit-btn-user{
        color: #33a6fc;
        background-color: #fff;
        font-size: 14px;
        display: inline-block;
        width: 80px;
        margin-right: 10px;
        height: 32px;
        line-height: 30px;
        border: 1px solid #2D8cF0;
        border-radius: 4px;
        text-align: center;
    }
    .flybase-submit-user a:hover{
        display: inline-block;
        width: 120px;
        height: 35px;
        line-height: 30px;
        border-radius: 3px;
        color: rgb(255,255,255);
        background: rgba(37,128,221,1);
    }
    .fade {
        opacity: 0;
        -webkit-transition: opacity .15s linear;
        -o-transition: opacity .15s linear;
        transition: opacity .15s linear;
    }
    .modal.in .modal-dialog {
        -webkit-transform: translate(0,0);
        -ms-transform: translate(0,0);
        -o-transform: translate(0,0);
        transform: translate(0,0);
    }
    .modal.fade .modal-dialog {
        -webkit-transition: -webkit-transform .3s ease-out;
        -o-transition: -o-transform .3s ease-out;
        transition: transform .3s ease-out;
        -webkit-transform: translate(0,-25%);
        -ms-transform: translate(0,-25%);
        -o-transform: translate(0,-25%);
        transform: translate(0,-25%);
    }
    .modal-content {
        -webkit-box-shadow: 0 5px 15px rgba(0,0,0,.5);
        box-shadow: 0 5px 15px rgba(0,0,0,.5);
    }
    .modal-content {
        position: relative;
        background-color: #fff;
        -webkit-background-clip: padding-box;
        background-clip: padding-box;
        border: 1px solid #999;
        border: 1px solid rgba(0,0,0,.2);
        border-radius: 6px;
        outline: 0;
        -webkit-box-shadow: 0 3px 9px rgba(0,0,0,.5);
        box-shadow: 0 3px 9px rgba(0,0,0,.5);
        margin: auto;
    }
    .modal-backdrop.in {
        filter: alpha(opacity=50);
        opacity: .5;
    }
    .modal-backdrop.fade {
        filter: alpha(opacity=0);
        opacity: 0;
    }

    .fade.in {
        opacity: 1;
    }

    .modal-backdrop {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        z-index: 1040;
        background-color: rgba(0, 0, 0, 0.37);
    }

    .fade {
        opacity: 0;
        -webkit-transition: opacity .15s linear;
        -o-transition: opacity .15s linear;
        transition: opacity .15s linear;
    }
    .bgclass{
        background:#353535;
        overflow: hidden;
        border: solid 1px #ececec;
        width: 190px;
        height: 30px;
        text-align: center;
        color: white;
        margin-bottom: 5px;
    }
    .gbclass{
        background:#afafaf ;
        overflow: hidden;
        border: solid 1px #ececec;
        width: 190px;
        height: 30px;
        text-align: center;
        color: white;
        margin-bottom: 5px;
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
<template>
    <div style="width: 1280px; height:auto; margin-top: 30px; padding-top: 40px; background:white">
    <Tabs value="name1" style="border: 1px solid #f0f0f0; margin-left: 40px; margin-right: 40px ">
        <TabPane label="员工基本信息" name="name1">

            <div style="width: 1280px;  margin-top: 10px; display: inline-block;background: white">
                <Form ref="employeeval" :model="employee" :label-width="150" :rules="employeeValidate">
                    <div style="width:880px; float:left;">
                    <Row>
                        <Col span="10">
                            <FormItem label="用户姓名" style="width: 350px;" prop="userName">
                                <Input v-model="employee.userName" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="性别" style="width: 350px;" prop="gender">
                                <Select v-model="employee.gender" placeholder="请选择用户性别">
                                    <Option v-for="te in sex" :value="te.sexName">{{te.sexId}}</Option>
                                </Select>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="人员类型" style="width: 350px;float: left;" prop="Technicalname">
                                <Select v-model="employee.jobTitle" @on-change="selectop" placeholder="请选择用户类型">
                                    <Option v-for="te in Technicalpost" :value="te.Technicalname">
                                        {{te.Technicalid}}
                                    </Option>
                                </Select>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="出生日期" style="width: 350px;" prop="birthday">
                                <DatePicker type="date" placeholder="选择日期" :editable="false"
                                            v-model="employee.birthday" style="width: 200px"></DatePicker>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="国籍" style="width: 350px;" prop="nationality">
                                <Input v-model="employee.nationality" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="民族" style="width: 350px;float: left;" prop="ethnicity">
                                <Input v-model="employee.ethnicity" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                    </Row>

                    <Row>
                        <Col span="10">
                            <FormItem label="教育程度" style="width: 350px;" prop="education">
                                <Select v-model="employee.education" placeholder="请选择" >
                                    <Option value="1">博士</Option>
                                    <Option value="2">研究生</Option>
                                    <Option value="3">本科</Option>
                                    <Option value="4">大专</Option>
                                    <Option value="5">大专以下</Option>
                                </Select>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="毕业院校" style="width: 350px;" prop="school">
                                <Input v-model="employee.school" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="身份证号码" style="width: 350px;" prop="cardId">
                                <Input v-model="employee.cardId" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="职务" style="width: 350px;" prop="techpos">
                                <Select v-model="employee.techpos" placeholder="请选择" >
                                    <Option value="主任教员">主任教员</Option>
                                    <Option value="地面主任教员">地面主任教员</Option>
                                    <Option value="助理主任教员">助理主任教员</Option>
                                    <Option value="（企业）检查员">（企业）检查员</Option>
                                </Select>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="隶属管理局" style="width: 350px;float: left;" prop="authorityId">
                                <Select v-model.Number="employee.authorityId" placeholder="请选择">
                                    <Option v-for="item in authoritys" :key="item.id" :value="item.id">
                                        {{item.name}}
                                    </Option>
                                </Select>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="隶属监管局" style="width: 350px;float: left;" prop="supervisionId">
                                <Select v-model.Number="employee.supervisionId" placeholder="请选择">
                                    <Option v-for="item in supervisions" :key="item.id" :value="item.id">
                                        {{item.name}}
                                    </Option>
                                </Select>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="出勤状态" style="width: 350px;float: left;" prop="turnOut">
                                <Select v-model="employee.turnOut" placeholder="请选择">
                                    <Option v-for="item in turn" :value="item.turnId">{{item.turnName}}</Option>
                                </Select>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="局方委任代表" style="width: 350px;float: left;" prop="isagent">
                                <Select v-model="employee.isagent" placeholder="请选择">
                                    <Option v-for="te in wethor" :value="te.weName">{{te.weId}}</Option>
                                </Select>
                            </FormItem>
                        </Col>
                    </Row>

                    <Row>
                        <Col span="10">
                            <FormItem label="所属运行基地" style="width: 350px;float: left;" prop="baseId">
                                <Select v-model="employee.baseId" placeholder="请选择">
                                    <Option v-for="item in operationbase" :key="item.baseId" :value="item.baseId">
                                        {{item.baseName}}
                                    </Option>
                                </Select>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="合同状态" style="width: 350px;float: left;" prop="contract">
                                <Select v-model="employee.contract" placeholder="请选择">
                                    <Option v-for="item in cons" :value="item.consId">{{item.consName}}</Option>
                                </Select>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="邮政编码" style="width: 350px;float: left;" prop="homePostcode">
                                <Input v-model="employee.homePostcode" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="手机号码" style="width: 350px;" prop="homeMobile">
                                <Input v-model="employee.homeMobile" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="有效通讯地址" style="width: 350px;" prop="homeAddress">
                                <Input v-model="employee.homeAddress" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9">
                            <FormItem label="电子邮箱" style="width: 350px;" prop="email">
                                <Input v-model="employee.email" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10">
                            <FormItem label="紧急联系人" style="width: 350px;float: left;" prop="urgencyLinkman">
                                <Input v-model="employee.urgencyLinkman" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9" v-show="isPoliot">
                            <FormItem label="技术身份级别" style="width: 350px;" prop="techClass">
                                <Select v-model="employee.techClass" @on-change="selectType" placeholder="请选择">
                                    <Option v-for="item in level" :value="item.id">{{item.name}}</Option>
                                </Select>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <!--<Col span="10"  v-show="teachType">
                            <FormItem label="教学类型" style="width: 350px;" prop="">
                                <Select v-model="employee.teachCategories" placeholder="请选择">
                                    <Option value="飞机">飞机</Option>
                                    <Option value="直升机">直升机</Option>
                                    <Option value="高性能">高性能</Option>
                                    <Option value="MPL训练">MPL训练</Option>
                                </Select>
                            </FormItem>
                        </Col>-->
                        <Col span="10" v-show="isPoliot">
                            <FormItem label="所属大队" style="width: 350px;float: left;" prop="flightTeam">
                                <Input v-model="employee.flightTeam" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9" v-show="isPoliot">
                            <FormItem label="飞行总时长（秒）" style="width: 350px;float: left;" prop="flySumTime">
                                <Input v-model="employee.flySumTime" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                    </Row>
                    <Row>
                        <Col span="10" v-show="isPoliot">
                            <FormItem label="违规次数" style="width: 350px;float: left;" prop="flySumIllegal">
                                <Input v-model="employee.flySumIllegal" placeholder="请输入"></Input>
                            </FormItem>
                        </Col>
                        <Col span="9"  v-show="isTeach">
                           <!-- <FormItem label="教学类型" style="width: 350px;" prop="">
                                <Select v-model="employee.teachCategories" placeholder="请选择">
                                    <Option value="飞机">飞机</Option>
                                    <Option value="直升机">直升机</Option>
                                    <Option value="高性能">高性能</Option>
                                    <Option value="MPL训练">MPL训练</Option>
                                </Select>
                            </FormItem>-->
                            <FormItem label="教员证书有效期" style="width: 350px;" prop="birthday">
                                <DatePicker type="date" placeholder="选择日期" :editable="false" style="width: 200px"
                                            v-model="employee.validityTime"></DatePicker>
                            </FormItem>
                        </Col>
                    </Row>
                     <Row>
                         <Col span="10"  v-show="teachType">
                             <FormItem label="教学类型" style="width: 350px;" prop="">
                                 <Select v-model="employee.teachCategories" placeholder="请选择">
                                     <Option value="飞机">飞机</Option>
                                     <Option value="直升机">直升机</Option>
                                     <Option value="高性能">高性能</Option>
                                     <Option value="MPL训练">MPL训练</Option>
                                 </Select>
                             </FormItem>
                         </Col>

                     </Row>


                    </div>
                    <div style="float:left; width:300px; margin-left: -50px"><word v-on:childurlone="urldata" ref="aircraftupdateurl"></word></div>
                    <div style="padding-bottom: 20px"></div>
                </Form>
            </div>

            <div v-show="isPoliot" style="width: 1280px; margin-top: 20px;background:white">
                    <!--<Row style="padding-top: 20px;padding-left: 20px">
                        &lt;!&ndash;<Col span="10">
                            <FormItem label="技术身份级别" style="width: 350px;" prop="techClass">
                                <Select v-model="employee.techClass" @on-change="selectType" placeholder="请选择">
                                    <Option v-for="item in level" :value="item.id">{{item.name}}</Option>
                                </Select>
                            </FormItem>
                        </Col>&ndash;&gt;
                        &lt;!&ndash;<Col span="9"  v-show="teachType">
                            <FormItem label="教学类型" style="width: 350px;" prop="">
                                <Select v-model="employee.teachCategories" placeholder="请选择">
                                    <Option value="飞机">飞机</Option>
                                    <Option value="直升机">直升机</Option>
                                    <Option value="高性能">高性能</Option>
                                    <Option value="MPL训练">MPL训练</Option>
                                </Select>
                            </FormItem>
                        </Col>&ndash;&gt;
                    </Row>-->
                    <word1 v-on:childurlone2="urlPilotData"></word1>
                    <br><br>
                    <!--<div v-show="isTeach" style="padding-left: 20px">
                        <FormItem label="教员证书有效期" style="width: 350px;" prop="birthday">
                            <DatePicker type="date" placeholder="选择日期" :editable="false"
                                        v-model="employee.validityTime"></DatePicker>
                        </FormItem>
                    </div>-->
                    <div v-show="isTeach">
                    <word3 v-on:childurlone4="urlPilotTeachData" ></word3>
                    </div>
            </div>
            <div v-show="isController" style="width: 1280px;  margin-top: 20px;background:white">
                <Row style="padding-top: 20px">
                    <word2 v-on:childurlone3="urlControllerData"></word2>
                </Row>
            </div>
            <div style="width: 1280px; background:white;  margin-bottom: 30px">
                <a data-v-942377fa="" href="javascript:;" @click="handleSubmit" class="submit-btn-user" style="margin-top: 40px;margin-left: 650px">保存</a>
                <a data-v-942377fa="" href="javascript:;" @click="clear" class="submit-btn-user" >返回</a>
            </div>
        </TabPane>

        <TabPane label="执照信息" name="name2">
            <licenselist :employeeId="employee.employeeId"></licenselist>
        </TabPane>

        <TabPane label="体检信息" name="name3">
            <phrecord :employeeId="employee.employeeId"></phrecord>
        </TabPane>

        <TabPane label="考试/检查信息" name="name4">
            <personexam :employeeId ="employee.employeeId"></personexam>
        </TabPane>

        <TabPane label="培训信息" name="name5">
            <traininfo :employeeId ="employee.employeeId"></traininfo>
        </TabPane>

        <TabPane label="工作经历" name="name7">
            <workexperience :employeeId ="employee.employeeId"></workexperience>
        </TabPane>

        <TabPane  label="熟练检查记录" name="name8">
            <skillcheck :pilotId ="employee.pilotId"></skillcheck>
        </TabPane>

        <TabPane label="定期检查记录" name="name9">
            <periodcheck :pilotId ="employee.pilotId"></periodcheck>
        </TabPane>

        <TabPane label="更新检查记录" name="name10">
            <updateccheck :pilotId ="employee.pilotId"></updateccheck>
        </TabPane>
    </Tabs>
    </div>
</template>
<script>
    import pList from './poliotTab.vue';
    import cList from './controllerManTab.vue';
    import word from './upImage.vue';
    import word1 from './upPilotImage.vue';
    import word2 from './upControllerImage.vue';
    import licenselist from './licenseList.vue';
    import phrecord from './newphysicalrecordlist.vue';
    import personexam from './newPersonexamrecord.vue';
    import traininfo from './newTraininfo.vue';
    import certificate from './newTrainingcertificate.vue';
    import workexperience from './workExperiencelist.vue';
    import skillcheck from './skillCheckrecordlist.vue';
    import periodcheck from './periodCheckRecordList.vue';
    import updateccheck from './updateRecordList.vue';
    import word3 from './upPilotTeachImage.vue';

    export default {
        components: {
            pList,
            cList,
            'word': word,
            'word1': word1,
            'word2':word2,
            'word3':word3,
            licenselist,
            phrecord,
            personexam,
            traininfo,
            certificate,
            workexperience,
            skillcheck,
            periodcheck,
            updateccheck,

        },
        data() {
            return {
                authoritys: [],
                supervisions: [],
                operationbase: [],
                Technicalpost: [{Technicalname: '飞行人员', Technicalid: '飞行人员'},{Technicalname: '管制人员', Technicalid: '管制人员'},{Technicalname: '维修人员', Technicalid: '维修人员'},
                    {Technicalname: '气象人员', Technicalid: '气象人员'},{Technicalname: '情报人员', Technicalid: '情报人员'},{Technicalname: '飞行签派人员', Technicalid: '飞行签派人员'},
                    {Technicalname: '市场人员', Technicalid: '市场人员'},{Technicalname: '财务人员', Technicalid: '财务人员'},{Technicalname: '保障人员', Technicalid: '保障人员'},
                    {Technicalname: '飞行管理人员', Technicalid: '飞行管理人员'}],
                TeachPos: [
                    {
                        TeachPosName: '主任教员',
                        TeachPosId: '主任教员'
                    },
                    {
                        TeachPosName: '地面主任教员',
                        TeachPosId: '地面主任教员'
                    },
                    {
                        TeachPosName: '助理主任教员',
                        TeachPosId: '助理主任教员'
                    },
                    {
                        TeachPosName: '（企业）检查员',
                        TeachPosId: '（企业）检查员'
                    }
                ],
                sex: [
                    {
                        sexName: '男',
                        sexId: '男'
                    },
                    {
                        sexName: '女',
                        sexId: '女'
                    }
                ],
                turn: [
                    {
                        turnName: '出勤',
                        turnId: '出勤'
                    },
                    {
                        turnName: '病假',
                        turnId: '病假'
                    },
                    {
                        turnName: '事假',
                        turnId: '事假'
                    },
                    {
                        turnName: '休假',
                        turnId: '休假'
                    },
                ],
                cons: [
                    {
                        consName: '全职',
                        consId: '全职'
                    },
                    {
                        consName: '兼职',
                        consId: '兼职'
                    }
                ],
                wethor: [
                    {
                        weName: '是',
                        weId: '是'
                    },
                    {
                        weName: '否',
                        weId: '否'
                    }
                ],
                level: [
                    {
                        name: '副驾驶',
                        id: '副驾驶'
                    }, {
                        name: '机长',
                        id: '机长'
                    }, {
                        name: '理论教员',
                        id: '理论教员'
                    }, {
                        name: '飞行教员',
                        id: '飞行教员'
                    }, {
                        name: '检查员',
                        id: '检查员'
                    }, {
                        name: '考试员',
                        id: '考试员'
                    }, {
                        name: '监察员',
                        id: '监察员'
                    }, {
                        name: '主任教员',
                        id: '主任教员'
                    }, {
                        name: '助理主任教员',
                        id: '助理主任教员'
                    }

                ],

                isPoliot: false,
                isController: false,
                teachType:false,
                isTeach:false,
                employee: {
                    employeeId:'',
                    userName: '',
                    jobTitle: '',
                    companyId: '',
                    userId: '',
                    pilot: '',
                    workId: '',
                    cardId: '',
                    gender: '',
                    birthday: '',
                    urgencyLinkman: '',
                    homePostcode: '',
                    nationality: '',
                    ethnicity: '',
                    education: '',
                    isagent: '',
                    age: '',
                    homeAddress: '',
                    school: '',
                    techpos:'',
                    homeMobile: '',
                    email: '',
                    authorityId: '',
                    supervisionId: '',
                    turnOut: '',
                    contract: '',
                    baseId: '',
                    techClass: '',
                    photo: '',
                    scanCard: '',
                    othersideCard:'',
                    wqc: '',
                    esCertificate: '',
                    chCertificate: '',
                    scanning: '',
                    skill:'',
                    englishLevel:'',
                    commuStatus:'',
                    skillLevel:'',
                    pilotId:'',
                    teachCategories:'',
                    scannedTeacher:'',
                    teacherQualification:'',
                    validityTime:'',
                    flightTeam:'',
                    flySumTime:'',
                    flySumIllegal:''

                },
                employeeValidate: {
                    /*userId: [
                        {required: true, message: '用户名不能为空', trigger: 'blur'}
                    ],
                    workId:[
                        {required: true, message: '用户名工号为空', trigger: 'blur'}
                    ],
                    email: [
                        { required: true, message: '邮箱不能为空', trigger: 'blur' },
                        { type: 'email', message: '邮箱格式不正确', trigger: 'blur' }
                    ],
                    cardId: [{required: true, message: '身份证号不能为空', trigger: 'blur'},
                        {pattern:/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,message: '身份证号输入不合法', trigger: 'blur'}],
                    homeMobile:[
                        { required: true, message: '手机号码不能为空', trigger: 'blur' },
                        {pattern:/^1(3|4|5|7|8)\d{9}$/,message: '工作电话输入不合法', trigger: 'blur'}
                    ],
                    userName:[
                        { required: true, message: '用户姓名不能为空', trigger: 'blur' },
                    ]*/

                }
            }

        },
        beforeMount: function (newval) {
            let self = this;
            self.$http.httpGet('/eim/api/company/search/orgname', {
                //查找全部管理局信息
                orgtype: 2
            }).then(function (response) {
                let datainfo = response.data;
                self.authoritys = datainfo;
            }).catch(function (error) {
                console.log(error);
            });

            self.$http.httpGet('/eim/api/company/search/orgname', {
                //查找全部监管局信息
                orgtype: 1
            }).then(function (response) {
                let datainfo = response.data;
                self.supervisions = datainfo;
            }).catch(function (error) {
                console.log(error);
            });

            self.$profile.getProfile().then((profile) => {
                self.$http.httpGet('/eim/api/operation/search/bycompanyid', {
                    //查找全部运行基地信息
                    companyId: profile.buz.companyId,
                }).then(function (response) {
                    let datainfo = response.data;
                    self.operationbase = datainfo;
                }).catch(function (error) {
                    console.log(error);
                });

            });

            self.$http.httpGet('/app/api/company', {
                //查询所有公司
            }).then(function (response) {
                let datainfo = response.data;
                self.airpcompanys = datainfo;
            }).catch(function (error) {
                console.log(error);
            });
        },
        mounted:function(){
            let self = this;
            self.pageNum = self.$route.query.page;


        },

        methods: {
            selectop: function () {
                if (this.employee.jobTitle == '飞行人员') {
                    let self = this;
                    self.isPoliot = true;
                    self.isController = false;
                } else if(this.employee.jobTitle == '管制人员'){
                    let self = this;
                    self.isPoliot = false;
                    self.isController = true;
                }else{
                    let self = this;
                    self.isPoliot = false;
                    self.isController = false;
                }
            },
            selectType:function(){
                if(this.employee.techClass == '理论教员'){
                    this.teachType=true;
                }else{
                    this.teachType=false;
                }
                if(this.employee.techClass =='理论教员'||this.employee.techClass =='飞行教员'||this.employee.techClass =='主任教员'||this.employee.techClass =='助理主任教员'){
                    this.isTeach=true;
                }else{
                    this.isTeach=false;
                }
            },

            urldata(msg, rt) {
                if (rt == 'itemflag') {
                    this.employee.photo = msg;
                } else if (rt == 'itemflag1') {
                    this.employee.scanCard = msg;
                }else if(rt == 'itemflag2'){
                    this.employee.othersideCard = msg;
                }
            },

            urlPilotData(msg, rt) {
                if (rt == 'itemflag3') {
                    this.employee.wqc = msg;
                } else if (rt == 'itemflag4') {
                    this.employee.esCertificate = msg;
                } else if (rt == 'itemflag5') {
                    this.employee.chCertificate = msg;
                } else if (rt == 'itemflag6') {
                    this.employee.scanning = msg;
                }
            },

            urlPilotTeachData(msg, rt){

              if(rt == 'itemflag3'){
                  this.employee.scannedTeacher = msg;
              }else if(rt=='itemflag4'){
                  this.employee.teacherQualification=msg;
              }
            },




            urlControllerData(msg, rt) {
                if (rt == 'itemflag7') {
                    this.employee.skill = msg;
                } else if (rt == 'itemflag8') {
                    this.employee.englishLevel = msg;
                } else if (rt == 'itemflag9') {
                    this.employee.commuStatus = msg;
                } else if (rt == 'itemflag10') {
                    this.employee.skillLevel = msg;
                }
            },


            getitem: function (item) {
                return item;
            },
            getuploadList: function ($event, employee) {
                employee.photo = $event;
            },


            handleSubmit: function () {
                this.$refs.employeeval.validate((valid) => {
                    if (valid) {
                        let self = this;
                        self.$profile.getProfile().then((profile) => {
                                this.employee.companyId = profile.buz.companyId,
                                    self.$http.jsonPost('/eim/api/employee/insert', self.employee).then(function (response) {
                                        if (response.data.resultCode === 200) {
                                           // alert(response.data.data.employeeId);
                                            //如果是飞行员  获取飞行员id
                                          //  alert(response.data.data.jobTitle);
                                            if(response.data.data.jobTitle === '飞行人员'){
                                               // alert('xxxx');
                                                self.getPilotId(response.data.data.employeeId)
                                            }
                                            self.employee.employeeId=response.data.data.employeeId;
                                            alert('操作成功');
                                        } else {
                                            alert('操作失败');
                                        }

                                    }).catch(function (error) {
                                        console.log(error);
                                        self.$Message.error('操作失败');
                                    });
                            }, (error) => {
                                console.log('error', error);
                            }
                        );
                    } else {
                        this.$Message.error('表单验证失败');
                    }
                });

            },
            clear: function () {
                history.go(-1);
            },

            getPilotId:function (id) {
                alert(id);
                let self = this;
                self.$http.httpGet('/eim/api/pilot/search/byEmployeeId', {
                    id,
                }).then(function (response) {
                    let datainfo = response.data.data;
                   // alert(datainfo.pilotId);
                    self.employee.pilotId = datainfo.pilotId;
                }).catch(function (error) {
                    console.log(error);
                });
            }

        }
    }
</script>