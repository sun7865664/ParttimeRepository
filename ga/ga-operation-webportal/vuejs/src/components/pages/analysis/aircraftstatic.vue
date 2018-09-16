<template>
    <div class="content" style="margin-left:15px;">
        <Breadcrumb separator="/">
            <BreadcrumbItem href="/">
                <Icon type="android-apps"></Icon>
                数据分析
            </BreadcrumbItem>
            <BreadcrumbItem>经营分析</BreadcrumbItem>
        </Breadcrumb>
        <div style="height: 300px;margin-bottom:50px;">
            <div style="margin-top:10px;margin-bottom:18px;border: 1px solid rgb(1,107,217);float: left;width:30%;background-color:rgba(226, 242, 255,0.65)">
                <div id="pilotpie" style="width:100%;height:300px;padding-top:10px;margin-bottom:18px;"></div>
            </div>
            <div style="margin-top:10px;margin-bottom:18px;border: 1px solid rgb(1,107,217);border-left:0px;float: right;width:70%;background-color:rgba(226, 242, 255,0.65)">
                <div id="pilotbar" style="width:100%;height:300px;padding-top:10px;margin-bottom:18px;"></div>
            </div>
        </div>
        <Row style="height: 40px;">
            <Col span="6">
            <span style="float: left;font-size: 18px;">从&nbsp;</span><DatePicker type="date" placeholder="选择日期" style="width: 200px;float: left" v-model="startDate"></DatePicker>
            </Col>
            <Col span="6">
            <span style="float: left;font-size: 18px;">到&nbsp;</span><DatePicker type="date" placeholder="选择日期" style="width: 200px;float: left" v-model="endDate"></DatePicker>
            </Col>
            <input class="analysis-but" type="button" @click="gettongji()" value="查询"/>
            <input class="analysis-but" type="button" @click="gettongjirecent30()" value="最近30天"/>
            <input class="analysis-but" type="button" @click="gettongjirecent90()" value="最近3个月"/>
        </Row>
        <div>
            <div class=" active div-list-aircraftdato" @click="open.showinfo = !open.showinfo">
                <div class="name" >
                    <div class="logoimgaircraft">
                        <img src="../../../assets/基本信息.png"  >
                    </div >
                    <div class="name-text">
                        飞行总时长详情
                    </div>
                    <div class="name-img">
                        <img v-if="open.showinfo" src="../../../assets/减号.png" style="margin-top: 15px">
                        <img v-else src="../../../assets/加号.png" style="margin-top: 8px">
                    </div>
                </div>
            </div>
            <Table v-show="open.showinfo" style="width: 979px" :columns="columns6" :data="tabledata"></Table>
            <Page :total="pagecount" @on-change="pageclick" :page-size="pagesize" style="height: 50px;float:right;padding: 10px 35px 0 0;" ></Page>
        </div>
    </div>
</template>

<script>
    // 引入 ECharts 主模块
    var echarts = require('echarts/lib/echarts');
    // 引入柱状图
    require('echarts/lib/chart/bar');
    require('echarts/lib/chart/line');
    // 引入饼图组件
    require('echarts/lib/chart/pie');
    // 引入提示框和标题组件
    require('echarts/lib/component/tooltip');
    require('echarts/lib/component/title');

    export default {
        data(){
            return {
                columns6: [
                    {
                        title: "国籍登记证号",
                        key: "registernumber",
                        align: 'center',
                        width: 191,
                    },
                    {
                        title: "航空器类别",
                        key: "aircraftClass",
                        width: 191,
                    },
                    {
                        title: "航空器型号",
                        key: "aircraftModel",
                        width: 191,
                    },
                    {
                        title: "总计时长(h)",
                        key: "sumTime",
                        sortable: true,
                        width: 191,
                    },
                    {
                        title: "所属公司",
                        key: "companyName",
                        width: 228,
                    }
                ],
                pagecount:'',
                pagesize:10,
                startDate:'',
                endDate:'',
                tabledata: [],
                open:{
                    showinfo:true,
                },
                piedata:[],
                bardata:[],
            }
        },
        created(){
            this.gettongjirecent90();
        },
        computed: {
            opinionpieData: function (){
                let temp = [];
                for (let row of this.piedata) {
                    temp.push(row)
                }
                return temp;
            },
            opinionbarData: function (){
                let temp = [];
                for (let row of this.bardata) {
                    temp.push(row)
                }
                return temp;
            },
            xdata: function(){
                let temp = [];
                for (let row of this.bardata) {
                    temp.push(row.name)
                }
                return temp;
            },
            ydata: function () {
                let temp = [];
                for (let row of this.bardata) {
                    temp.push(row)
                }
                return temp;
            }

        },
        mounted(){
            this.mybarChart = echarts.init(document.getElementById('pilotbar'));
            this.mypieChart = echarts.init(document.getElementById('pilotpie'));
            this.initData();
        },
        methods: {
            gettongji(){
                var d = new Date(this.startDate);
                this.startDate = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
                var d = new Date(this.endDate);
                this.endDate = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
                this.getoperationdata();
                this.gettabledata(1);
            },
            gettongjirecent30(){
                let date= this.timeForMat(30);
                this.startDate = date.t2;
                this.endDate = date.t1;
                this.getoperationdata();
                this.gettabledata(1);
            },
            gettongjirecent90(){
                let date= this.timeForMat(90);
                this.startDate = date.t2;
                this.endDate = date.t1;
                this.getoperationdata();
                this.gettabledata(1);
            },
            timeForMat(count){
                let time1 = new Date()
                time1.setTime(time1.getTime() - (24 * 60 * 60 * 1000))
                let Y1 = time1.getFullYear()
                let M1 = ((time1.getMonth() + 1) > 10 ? (time1.getMonth() + 1) : '0' + (time1.getMonth() + 1))
                let D1 = (time1.getDate() > 10 ? time1.getDate() : '0' + time1.getDate())
                let timer1 = Y1 + '-' + M1 + '-' + D1 // 当前时间
                let time2 = new Date()
                time2.setTime(time2.getTime() - (24 * 60 * 60 * 1000 * count))
                let Y2 = time2.getFullYear()
                let M2 = ((time2.getMonth() + 1) >= 10 ? (time2.getMonth() + 1) : '0' + (time2.getMonth() + 1))
                let D2 = (time2.getDate() > 10 ? time2.getDate() : '0' + time2.getDate())
                let timer2 = Y2 + '-' + M2 + '-' + D2 // 之前的7天或者30天
                return {
                    t1: timer1,
                    t2: timer2
                }
            },
            initData(){
                const pieoption = {
                    title : {
                        text: '航空器型号比例',
                        x:'center',
                        textStyle:{
                            color:"rgb(1,107,217)"
                        },
                    },
                    color:['#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570'],
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    series : [
                        {
                            name: '数量',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '50%'],
                            data: this.opinionpieData,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                const baroption=({
                    title : {
                        text: '各型号航空器飞行总时长',
                        x:'center',
                        textStyle:{
                            color:"rgb(1,107,217)"
                        },
                    },
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '3%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            axisLabel:{
                                color:'rgb(1,107,217)'
                            },
                            axisLine:{
                                lineStyle:{
                                    color:'rgb(1,107,217)'
                                }
                            },
                            data : this.xdata,
                            axisTick: {
                                alignWithLabel: true
                            },
                            padding:[0,-20,0,0]
                        }
                    ],
                    yAxis : [
                        {
                            name:'飞行总时长',
                            nameTextStyle:{
                                color:'rgb(1,107,217)'
                            },
                            axisLabel:{
                                formatter: '{value} 小时',
                                color:'rgb(1,107,217)'
                            },
                            axisLine:{
                                lineStyle:{
                                    color:'rgb(1,107,217)'
                                },
                            },
                            type : 'value'

                        }
                    ],
                    series : [
                        {
                            data:this.opinionbarData,
                            barWidth: '60%',
                            type: 'bar',
                            barMaxWidth: 50,
                            itemStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#83bff6'},
                                            {offset: 0.5, color: '#188df0'},
                                            {offset: 1, color: '#188df0'}
                                        ]
                                    )
                                },
                                emphasis: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#2378f7'},
                                            {offset: 0.7, color: '#2378f7'},
                                            {offset: 1, color: '#83bff6'}
                                        ]
                                    )
                                }
                            },
                        }
                    ]

                })
                this.mypieChart.setOption(pieoption);
                this.mybarChart.setOption(baroption);
            },
            getoperationdata () {
                this.$profile.getProfile().then((profile) => {
                    let self = this;
                    let data = {};
                    self.piedata = [];
                    self.bardata = [];
                    let companyIds = profile.buz.companyId;
                    self.$http.httpGet('/app/api/aircraft/search/findaircraftmodelbycompanyids', {companyids:companyIds}).then((res) => {
                        let result = res.data;
                        for (let line of result)
                        {
                            let map={ name: line[0],value: line[1] };
                            self.piedata.push(map)
                        }
                    });
                    self.$http.httpGet('/app/api/aircraft/search/findallaircraftfly', {
                        companyIds:companyIds,
                        startDate:this.startDate,
                        endDate:this.endDate
                    }).then((res) =>{
                        let result = res.data.data;
                        let hour;
                        for (let line of result)
                        {
                            hour = Math.round(line[1]/3600*100)/100
                            let map={ name: line[0],value: hour };
                            self.bardata.push(map)
                        }
                    })
                }, (error) => {
                    console.log('error', error);
                });
            },
            pageclick:function (obj) {
                this.gettabledata(obj);
            },
            gettabledata (obj) {
                this.$profile.getProfile().then((profile) => {
                    let self = this;
                    let companyIds = profile.buz.companyId;
                    let url = '/app/api/aircraft/search/findviewlisttable';
                    console.log("companyId:",)
                    self.$http.httpGet(url, {
                        pageno: obj-1,
                        pagesize: self.pagesize,
                        companyIds:companyIds,
                        startDate:this.startDate,
                        endDate:this.endDate,
                    }).then((res) => {
                        let result = res.data.content
                        self.pagecount = res.data.totalElements;
                        for (let line of result){
                            line.sumTime = Math.round(line.sumTime/3600*100)/100
                            line.companyName = line.companyId.name;
                        }
                        self.tabledata = result;
                    })
                }, (error) => {
                    console.log('error', error);
                });
            },

        },
        watch: {
            tabledata: function(val){
               this.initData()
            },
            opinionpieData: function(val){
                this.initData()
            },
            opinionbarData: function(val){
                this.initData()
            }
        }
    }
</script>
<style scoped>
    .analysis-but{
        width: 80px;
        background-color: rgb(1,107,217);
        border-radius:5px;
        height: 30px;
        font-size: 13px;
        line-height: 30px;
    }

    .div-list-aircraftdato{
        width: 979px;
        height: 34px;
        background-color: rgba(255,255,255,0.65) ;
        border:1px solid rgb(1,107,217);
        font-size: 14px;
        font-family: "Microsoft YaHei Regular", "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", Arial, sans-serif;
        color: rgb(1,107,217);
        margin-bottom: 4px;
    }
    .div-list-aircraftdato .logoimgaircraft{
        width: 34px;
        float:left;
        vertical-align: middle;
    }
    .name-text{
        float:left;
        margin-left: 16px;
        line-height: 34px
    }
    .name-img{
        float: right;
        margin-right: 11px;
    }

</style>