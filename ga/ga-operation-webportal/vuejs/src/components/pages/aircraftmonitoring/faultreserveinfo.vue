<template>
    <div id="faultreserveinfo" style="width: 1280px; height:auto; margin-top: 30px;display: inline-block;background: white;padding: 40px 20px;margin-bottom:16px;">
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
                            <span>故障保留单编号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.no}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>航空器型号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.aircraftModel}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>航空器注册号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.aircraftRegNo}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>保留单位</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.reserveCompany}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>ATA章节</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.ataSection}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>保留期限</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.reserveDate}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>保留故障描述</span>
                        </div>
                    </td>
                    <td colspan="3">
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.faultDescribe}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>保留故障原因</span>
                        </div>
                    </td>
                    <td colspan="3">
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.faultReserveCause}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>保留依据</span>
                        </div>
                    </td>
                    <td colspan="3">
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.reserveBasis}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>已采取措施</span>
                        </div>
                    </td>
                    <td colspan="3">
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.measuresTaken}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>处理状态</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.status}}</span>
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
                            <span>申请人</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.apply}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>申请时间</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.applyTime}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>审批人</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.approver}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>审批时间</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.approveTime}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>完成人</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.completor}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>完成时间</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{faultreserveinfo.completeTime}}</span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
export default {
  name: "faultreserveinfo",
  props: ['id'],
  data() {
    return {
      faultreserveinfo: {
        no: "",
        ataSection: "",
        aircraftModel: "",
        aircraftRegNo: "",
        reserveCompany: "",
        reserveDate: "",
        faultDescribe: "",
        faultReserveCause: "",
        reserveBasis: "",
        status: "",
        measuresTaken: "",
        apply: "",
        applyTime: "",
        approver: "",
        approveTime: "",
        completor: "",
        completeTime: ""
      },
    };
  },
  created () {
      this.id = this.$route.query.Id;
      this.getFaultReserveById(this.id);
  },
  methods: {
    onclose: function() {
       this.$router.push({path:'/aircraftmonitoring/tabs',query: {value:'faultreserve' }})
    },
    getFaultReserveById: function (id) {
        var self = this;
        self.$http.httpGet('/eim/api/mmis/getFaultReserveById', {
            id: id
        }).then((res) => {
            console.log("getWorkListByPage res", res);
            self.faultreserveinfo = res.data;

        }).catch(function (error) {
            console.log(error);
        });
    }
  }
};
</script>


<style>
#faultreserveinfo table td {
    width: 25%;
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

