<template>
    <div id="workreserve" style="width: 100%;display: inline-block;background: white;padding: 0 10px;margin-bottom:16px;">
        <Form ref="formItem" :model="formItem" :label-width="110" inline style="width:100%;font-size:0;">
            <FormItem class="ws-form-span8" style="margin-right: 0;" label="编号">
                <Input v-model="formItem.userName" placeholder="请输入编号" />
            </FormItem>
            <FormItem class="ws-form-span8" style="margin-right: 0;" label="航空器型号" >
                <Select v-model="formItem.baseId" number="true"  placeholder="请选择">
                    <Option v-for="site in supervision" :key="site.baseId" :value="site.baseId">{{ site.baseName }}</Option>
                </Select>
            </FormItem>
            <FormItem class="ws-form-span8" style="margin-right: 0;" label="航空器注册号" >
                <Select v-model="formItem.baseId" number="true"  placeholder="请选择">
                    <Option v-for="site in supervision" :key="site.baseId" :value="site.baseId">{{ site.baseName }}</Option>
                </Select>
            </FormItem>
            <FormItem class="ws-form-span8" style="margin-right: 0;" label="工作单卡编号" >
                <Input v-model="formItem.techpos" placeholder="请输入工作单卡编号"></Input>
            </FormItem>
            <FormItem class="ws-form-span8" style="margin-right: 0;" label="推迟期限" >
                <Input v-model="formItem.techpos" placeholder="请输入工作单卡编号"></Input>
            </FormItem>
            <FormItem class="ws-form-span8" style="margin-right: 0;" label="处理状态" >
                <Select v-model="formItem.baseId" number="true"  placeholder="请选择">
                    <Option v-for="site in supervision" :key="site.baseId" :value="site.baseId">{{ site.baseName }}</Option>
                </Select>
            </FormItem>
            <FormItem style="width:100%; text-align:right;">
                <Button type="primary" @click="reset" style="margin-left:0;">重置</Button>
                <Button type="primary" @click="init(1)" style="margin-left:0;">查询</Button>
            </FormItem>
        </Form>
        <div>
            <div class="bottom5">
                <Table border :columns="columns" :data="workreserves" style="width:1158px;"/>
            </div>
            <Page :total="pagecount" @on-change="pageclick" @on-page-size-change="pagesizeclick" :page-size="pagesize" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
        </div>
    </div>
</template>

<script>
export default {
    data () {
        return {
            formItem: {
                userName: '',
                baseId:'',
                techpos: '',
                homeMobile: ''
            },
            workreserves: [
                {
                    id:"0701",
                    aircraftModel:"",
                    aircraftRegNo:"",
                    wocNo:"",
                    wocTitle:"",
                    delayDate:"",
                    status:"",
                    action:"",
                }
            ],
            columns: [
                {
                    title: '编号',
                    key: 'id',
                    align: 'center',
                    width: 100,
                    render: (h, params) => {
                        console.log(params, params.column);
                        
                        return h('div',  [
                            h('a', {
                                props: {
                                   href:"#"
                                },
                                style: {
                                    
                                },
                                on: {
                                    click: () => {
                                        this.toview(params.index);
                                    }
                                }
                            }, params.row.id),
                        ]);
                    }
                },
                {
                    title: '航空器型号',
                    width: 160,
                    key: 'aircraftModel',
                    align: 'center'
                },
                {
                    title: '航空器注册号',
                    width: 160,
                    key: 'aircraftRegNo',
                    align: 'center'
                },
                {
                    title: '工作单卡编号',
                    width: 160,
                    key: 'wocNo',
                    align: 'center'
                },{
                    title: '工作单卡标题',
                    width: 240,
                    key: 'wocTitle',
                    align: 'center'
                },{
                    title: '推迟期限',
                    width: 100,
                    key: 'delayDate',
                    align: 'center'
                },{
                    title: '处理状态',
                    width: 100,
                    key: 'status',
                    align: 'center'
                },
                {
                    title: '操作',
                    // width: 137,
                    key: 'action',
                    align: 'center'
                }
            ],
        }
    },
    methods: {
        toview(index) {
            this.$router.push({
                path: '/aircraftmonitoring/workreserveinfo',
                query: {Id: this.workreserves[index].id}
            });
        },
    }
}
</script>
<style>
    .ws-form-span8 {
        width: 33.33333%;
    }
    td {
        max-width: 100%;
    }
</style>


