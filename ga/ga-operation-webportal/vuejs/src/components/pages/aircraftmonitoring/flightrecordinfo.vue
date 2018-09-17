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
        <div class="bottom5">
            <span class="tabletitle">排故记录</span>
            <Table border :columns="columns1" :data="data1"/>
        </div>
        <div class="bottom5">
            <span class="tabletitle">换件记录</span>
            <Table border :columns="columns2" :data="data2"/>
        </div>
        <div class="bottom5">
            <span class="tabletitle">AD/SB执行记录</span>
            <Table border :columns="columns3" :data="data3"/>
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
    };
  },
  created: function() {
      
      this.flightrecordinfoinfo = {
        no: "",
        companyName: "",
        aircraftModel: "",
        aircraftRegNo: "",
        aircraftFlyTime: "",
        riseFall: "",
        loop1: "",
        captain: "",
        releaser: "",
        releaseTime: "",
        detrusionTime: "",
        takeOffTime: "",
        closeTime: "",
        addFuel: "",
        fuel: "",
        surplusFuel: "",
        workRecord: "",

      };
  },
  methods: {
    onclose: function() {
       this.$router.push({path:'/aircraftmonitoring/tabs',query: {value:'flightrecord' }})
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
</style>

