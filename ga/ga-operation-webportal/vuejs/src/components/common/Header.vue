<template>
<div>
    <header class="header">
        <a href="/home" class="operation-logo" style="float: left"></a>
        <div class="user">
            <div style="float: right; margin-top: 24px">
                <Dropdown trigger="click" style="margin-left: 4px; margin-right: 30px">
                    <a href="javascript:void(0)">
                        <span style="color:#8E9396;">{{username}}</span>
                        <Icon type="ios-arrow-down" style="color:#8E9396"></Icon>
                    </a>
                    <DropdownMenu slot="list">
                        <DropdownItem>
                            <a href="javascript:;"  @click="updatepwd">
                                <span style="color:#8E9396">修改密码</span>
                            </a>
                        </DropdownItem>
                        <DropdownItem>
                            <a @click="logout"><span style="color:#8E9396">退出</span></a>
                        </DropdownItem>
                    </DropdownMenu>
                </Dropdown>
            </div>
            <div style="float: right; margin-top: 15px">
                <Avatar icon="ios-person" size="large" style="background-color: #C7DBEA;"></Avatar>
            </div>
        </div>
    </header>
    <Modal v-model="modal1"
            title="修改密码"
            @on-ok="oks('formCustom')"
            @on-cancel="cancel">
           <Form :model="newUser" :label-width="80"  style="padding-bottom: 1px;" :rules="ruleInline" ref="formCustom" inline>
               <FormItem  label="旧密码" style="" prop="cp">
                   <Input type="password" v-model="newUser.cp" placeholder="请输入" style="width: 320px;"></Input>
               </FormItem>

               <FormItem label="新密码" style="" prop="np">
                   <Input type="password" v-model="newUser.np" placeholder="请输入" style="width: 320px;"></Input>
               </FormItem>

               <FormItem label="确认密码" style="" prop="qnp">
                   <Input type="password" v-model="newUser.qnp" placeholder="请输入" style="width: 320px;"></Input>
               </FormItem>
           </Form>

    </Modal>
</div>
</template>
<style scoped>
    .user{
        float: right;
    }

</style>
<script>
    import Cookies from "js-cookie";
    import util from "@/libs/util.js";
    export default {
        data () {
            const validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.newUser.qnp !== '') {
                        // 对第二个密码框单独验证
                        this.$refs.formCustom.validateField('qnp');
                    }
                    callback();
                }
            };
            const validatePassCheck = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.newUser.np) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            return {
                logo:'',
                imgsrc:'../../../static/images/default-user.png',
                username: '',
                userId: "",
                newUser: {},
                ruleInline: {
                    cp: [
                        { required: true, message: '请填写旧密码', trigger: 'blur' }
                    ],
                    np: [
                        { validator: validatePass, required: true,trigger: 'blur' },
                        { required: true, message: '请填写新密码', trigger: 'blur' },
                        { type: 'string', min: 6, message: '密码长度不能小于6位', trigger: 'blur' }
                    ],
                    qnp:[
                        { validator: validatePassCheck,required: true, trigger: 'blur' },
                        { required: true, message: '请填写确认密码', trigger: 'blur' },
                        { type: 'string', min: 6, message: '密码长度不能小于6位', trigger: 'blur' }
                    ]
                },
                modal1: false
            }
        },
        created(){
            this.getlogo();
            // this.$profile.getProfile().then((profile) => {
            //     this.userName = profile.user.fullname
            // }, (error) => {
            //     console.log('error', error);
            // });
        },
        methods:{
            init() {
                let userInfo = JSON.parse(Cookies.get("userInfo"));
                this.username = userInfo.username;
                this.userId = userInfo.id;
            },

            logout: function () {
                this.$store.commit("logout", this);
                // 强制刷新页面 重新加载router
                location.reload();
            },
            getlogo(){
                let self = this;
            },
            updatepwd:function () {
               this.modal1=true;
            }, oks (name) {
                this.$refs[name].validate((valid) => {
                    if (valid) {
                        let self=this;
                        self.$http.httpGet('/app/api/sysuser/update/pwd',{
                            op:self.newUser.cp,
                            np:self.newUser.qnp
                        }).then(function (response) {
                            self.$Message.success('密码修改成功!');
                        }).catch(function (error) {
                            console.log(error);
                        });
                    } else {
                        this.$Message.error('表单验证失败!');
                    }
                })
            },
            cancel () {
                this.$Message.info('点击了取消');
            }
        },
        mounted() {
            this.init();
        },

    }

</script>