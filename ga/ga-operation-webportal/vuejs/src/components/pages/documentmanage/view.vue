<template>
    <div style="width: 1280px; height: 900px; margin-top: 40px; background:white;">
        <div style="background: #FAFAFA; height: 36px; padding-top: 6px; margin: 22px 0px 3px 0px;padding: 6px 0 0 0;">
            <img src="../../../../static/images/基础资料图标.png" style="float: left;margin: 40px 13px 0px 40px;">
            <span style="font-size: 16px; color: #606265;">信息收发-信息详情</span>
        </div>
        <div style="border: solid 1px #DCDFE6; bottom: 0px;top: 76px;width: 965px; right: 26px; padding: 32px 0 0 46px; margin-left: 40px">
            <div>
                <div class="left" style="height: 700px;width:56px;float: left;">
                    <div style=" width: 100%;margin-bottom: 15px; height: 30px;color: #606265; font-size: 14px;padding-top: 3px;">
                        <span style="color: red">*</span><span>标&nbsp;&nbsp;&nbsp;题:</span>
                    </div>
                    <div style="color: #606265; font-size: 14px;">
                        <span style="color: red">*</span><span>内&nbsp;&nbsp;&nbsp;容:</span>
                    </div>
                </div>
                <div class="right" style="width: 815px;float: left">
                    <input v-model="title" style="width:100%; border: #DCDFE6 1px solid; margin-bottom: 15px; height: 30px; color: #606265;" readonly/>
                    <ue v-if="flag" :defaultMsg=Msg :config=config :id=id ></ue>
                    <div  style="margin-top: 20px">
                        <template v-for="item in filepath" >
                            <a :href="item.url" style="color:#0000009c; margin-right: 10px; margin-top: 5px; margin-bottom: 10px; font-size: 14px;">{{item.name}}</a>
                        </template>
                    </div>
                </div>
            </div>
            <div class="func" style="margin-left: 43%;margin-top: 30px; margin-bottom: 30px">
                <a data-v-942377fa="" href="javascript:;" style="margin-top: 30px" class="look" @click="back">返回</a>
            </div>
        </div>
    </div>
</template>
<script>
    import ue from '../../ext/ue/ue.vue';

    export default {
        components: {
            ue,

        },
        data() {
            return {
                flag:false,
                filepath:[],
                Msg:'',
                type:[],
                title:'',
                reciverid:[],
                recivername:[],
                id: 'documentview',
                config: {
                    UEDITOR_HOME_URL: '/static/UE/',
                    initialFrameHeight: 200,
                    readonly:true,
//                    initialContent:this.getinitialContent()
//                themePath:'static/UE/themes/'
                }
            }
        },
        created(){
            let self = this;


            self.$http.httpGet('/app/api/doclist/'+self.$route.query.Id, {

            }).then((res) => {
                let result = res.data;
                self.title=result.title;
                self.Msg=result.content;
                self.filepath=eval(result.filepath);
                self.flag=true;
                console.log(self.filepath);


            })



        },

        methods: {
            back(){
                history.go(-1);
            }
        },
        watch:{


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
        line-height: 20px;
        border: 1px solid #f0f0f0;
        border-radius: 3px;
        color: #606265;
        background: #FAFAFA;
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
    .ivu-transfer-list-content-item{
        color: beige;
    }
</style>