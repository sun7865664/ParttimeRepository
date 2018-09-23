<template>
    <div id="flightrecordinfoinfo" style="width: 1280px; height:auto; margin-top: 30px;display: inline-block;background: white;padding: 40px 20px;margin-bottom:16px;">
        <Form style="margin-bottom:16px;">
            <div>
                <div style="width: 100%;; display:inline-block;text-align:right;">
                    <Button @click="onclose" class="cancelBtn">返回</Button>
                </div>
            </div>
        </Form>
        <table cellspacing="0" cellpadding="0" border="0" class="ivu-table ivu-table-border" style="border: 1px solid #dcdee2; width: 100%;">
            <tbody class="ivu-table-tbody">
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>飞行记录本编号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.no}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>公司名称</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.companyName}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>航空器型号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.aircraftModel}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>航空器注册号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.aircraftRegNo}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>飞行时间</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.aircraftFlyTime}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>起落架次</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.riseFall}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>发动机循环数</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.loop1}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>机长</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.captain}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>放行人</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.releaser}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>放行时间</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.releaseTime}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>推出时刻</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.detrusionTime}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>起飞时刻</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.takeOffTime}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>降落时刻</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.landTime}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>关车时刻</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.closeTime}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>燃油添加量</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.addFuel}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>总燃油量</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.fuel}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>剩余燃油量</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.surplusFuel}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span></span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span></span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>工作记录</span>
                        </div>
                    </td>
                    <td colspan="3">
                        <div class="ivu-table-cell">
                            <span>{{flightrecordinfoinfo.workRecord}}</span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="tablerow">
            <div class="bottom5">
                <span class="tabletitle">排故记录</span>
                <Table border :columns="columns1" :data="data1"/>
            </div>
            <Page :total="pagecount1" @on-change="pageclick1" @on-page-size-change="pagesizeclick1" :page-size="pagesize1" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
        </div>
        <div class="tablerow">
            <div class="bottom5">
                <span class="tabletitle">换件记录</span>
                <Table border :columns="columns2" :data="data2"/>
            </div>
            <Page :total="pagecount2" @on-change="pageclick2" @on-page-size-change="pagesizeclick2" :page-size="pagesize2" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
        </div>
        <div class="tablerow">
            <div class="bottom5">
                <span class="tabletitle">AD/SB执行记录</span>
                <Table border :columns="columns3" :data="data3"/>
            </div>
            <Page :total="pagecount3" @on-change="pageclick3" @on-page-size-change="pagesizeclick3" :page-size="pagesize3" style="height: 50px;float:right;padding-right:32px;margin-top: 8px;" show-sizer ></Page>
        </div>
        
    </div>
</template>

<script>
export default {
  name: "flightrecordinfoinfo",
  props: ['id'],
  data() {
    return {
      flightrecordinfoinfo: {},
      columns1: [
        {
            title: '发现故障',
            key: 'faultDescribe',
            align: 'center',
        },
        {
            title: '发现人',
            key: 'discovery',
            align: 'center',
        },
        {
            title: '处理措施',
            key: 'dealWith',
            align: 'center',
        },
        {
            title: '处理措施',
            key: 'dealWho',
            align: 'center',
        },
        {
            title: '是否保留',
            key: 'isReserve',
            align: 'center',
        },
        {
            title: '更新时间',
            key: 'reviseTime',
            align: 'center',
        },
      ],
      data1: [],
      columns2: [
        {
            title: '部件类型',
            key: 'partsType',
            align: 'center',
        },
        {
            title: '拆卸部件件号',
            key: 'brokenPartNo',
            align: 'center',
        },
        {
            title: '拆卸部件序号',
            key: 'brokenSerialNo',
            align: 'center',
        },
        {
            title: '安装部件件号',
            key: 'installPartNo',
            align: 'center',
        },
        {
            title: '安装部件序号',
            key: 'installSerialNo',
            align: 'center',
        },
        {
            title: '安装部件航材合格证',
            key: 'installPartCertificate',
            align: 'center',
        },
        {
            title: '更新时间',
            key: 'reviseTime',
            align: 'center',
        },
      ],
      data2: [],
      columns3: [
        {
            title: '适航指令/服务编号通告',
            key: 'asNo',
            align: 'center',
        },
        {
            title: '通告标题',
            key: 'asTitle',
            align: 'center',
        },
        {
            title: '通告类型',
            key: 'parentType',
            align: 'center',
        },
        {
            title: '更新时间',
            key: 'reviseTime',
            align: 'center',
        },
      ],
      data3: [],
      pageno1:1,
      pagecount1:0,
      pagesize1: 10,
      pageno2:1,
      pagecount2:0,
      pagesize2: 10,
      pageno3:1,
      pagecount3:0,
      pagesize3: 10,
    };
  },
  created: function() {
      this.id = this.$route.query.Id;
      this.init();
  },
  methods: {
    init: function() {
        this.getFlightRecordById(this.id);
        this.getFaultRecordByParentId(1);
        this.getReplaceRecordByParentId(1);
        this.getADRecordByParentId(1);
    },
    onclose: function() {
       this.$router.push({path:'/aircraftmonitoring/tabs',query: {value:'flightrecord' }})
    },
    getFlightRecordById: function (id) {
        var self = this;
        self.$http.httpGet('/eim/api/mmis/getFlightRecordById', {
            id: id
        }).then((res) => {
            self.flightrecordinfoinfo = res.data;

        }).catch(function (error) {
            console.log(error);
        });
    },
    pageclick1:function (obj) {
        this.pageno1 = obj;
        this.getFaultRecordByParentId(obj);
    },
    pagesizeclick1: function(size) {
        this.pagesize1 = size;
        this.getFaultRecordByParentId(1);
    },
    getFaultRecordByParentId: function (no) {
        var self = this;
        self.$http.httpGet('/eim/api/mmis/getFaultRecordByParentId', {
            parentId: this.id,
            pageSize: self.pagesize1,
            page: no
        }).then((res) => {
            self.data1 = res.data.content;
            self.pagecount1 = res.data.totalElements;
            self.pageno1 = no;

        }).catch(function (error) {
            console.log(error);
        });
    },
    pageclick2:function (obj) {
        this.pageno2 = obj;
        this.getReplaceRecordByParentId(obj);
    },
    pagesizeclick2: function(size) {
        this.pagesize2 = size;
        this.getReplaceRecordByParentId(1);
    },
    getReplaceRecordByParentId: function (no) {
        var self = this;
        self.$http.httpGet('/eim/api/mmis/getReplaceRecordByParentId', {
            parentId: this.id,
            pageSize: self.pagesize2,
            page: no
        }).then((res) => {
            self.data2 = res.data.content;
            self.pagecount2 = res.data.totalElements;
            self.pageno2 = no;

        }).catch(function (error) {
            console.log(error);
        });
    },
    pageclick3:function (obj) {
        this.pageno3 = obj;
        this.getADRecordByParentId(obj);
    },
    pagesizeclick3: function(size) {
        this.pagesize3 = size;
        this.getADRecordByParentId(1);
    },
    getADRecordByParentId: function (no) {
        var self = this;
        self.$http.httpGet('/eim/api/mmis/getADRecordByParentId', {
            parentId: this.id,
            pageSize: self.pagesize3,
            page: no
        }).then((res) => {
            self.data3 = res.data.content;
            self.pagecount3 = res.data.totalElements;
            self.pageno3 = no;

        }).catch(function (error) {
            console.log(error);
        });
    }

    
  }
};
</script>


<style>
#flightrecordinfoinfo table td {
    width: 25%;
}
.tabletitle {
    margin: 20px 10px 10px 10px;
    display: block;
}
.cancelBtn {
  width: 98px;
  height: 32px;
  /* margin:24px 43px 11px 0px; */
  border: 1px dashed #2b82da;
  background: #ddf4ff;
  font-size: 14px;
  color: #2fa5fb;
}
.tablerow {
    width: 100%;
    height: auto;
    overflow: hidden;
}
</style>

