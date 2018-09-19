<template>
    <div id="engine" style="width: 100%; height:auto; display: inline-block;background: white;padding: 0px 20px;margin-bottom:16px;">
        <div v-for="(engine, index) in engines" :key="index">
            <span class="tabletitle">发动机{{index+1}}</span>
            <table cellspacing="0" cellpadding="0" border="0" class="ivu-table ivu-table-border" style="border: 1px solid #dcdee2; width: 100%;">
                <tbody class="ivu-table-tbody">
                    <tr class="ivu-table-row">
                        <td>
                            <div class="ivu-table-cell">
                                <span>发动机型号</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.model}}</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>序号</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.serial}}</span>
                            </div>
                        </td>
                    </tr>
                    <tr class="ivu-table-row">
                        <td>
                            <div class="ivu-table-cell">
                                <span>循环数寿命（次）</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.lifeCycleTime}}</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>装机日期</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.equipmentDate}}</span>
                            </div>
                        </td>
                    </tr>
                    <tr class="ivu-table-row">
                        <td>
                            <div class="ivu-table-cell">
                                <span>剩余循环数（次）</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.remainCycleTime}}</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>装机航空器</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.aircraftId}}</span>
                            </div>
                        </td>
                    </tr>
                    <tr class="ivu-table-row">
                        <td>
                            <div class="ivu-table-cell">
                                <span>飞行小时数寿命（小时）</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.remainFlyTime}}</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>生产厂家</span>
                            </div>
                        </td>
                        <td>
                            <div class="ivu-table-cell">
                                <span>{{engine.manufacturer}}</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
export default {
  name: "engine",
  props: ['id'],
  data() {
    return {
      engines: [{
        model: "",
        serial: "",
        lifeCycleTime: "",
        equipmentDate: "",
        remainCycleTime: "",
        aircraftId: "",
        remainFlyTime: "",

        reserveDate: "",
        faultDescribe: "",
        faultReserveCause: "",
        reserveBasis: "",
        status: "",
        delayDate: "",
        applicant: "",
        applyTime: "",
        approver: "",
        approveTime: "",
        completor: "",
        completorTime: ""
      }]
    };
  },
  props: ['regNumber'],
  mounted () {
    this.getEngineListByRegNumber(this.regNumber);
  },
  methods: {
    getEngineListByRegNumber: function (regNumber) {
        var self = this;
        self.$http.httpGet('/eim/api/engine/getEngineListByRegNumber', {
            regNumber: regNumber
        }).then((res) => {
            console.log("getEngineListByRegNumber res", res);
            self.engines = res.data;

        }).catch(function (error) {
            console.log(error);
        });
    }
  }
};
</script>


<style>
#engine table td {
    width: 25%;
}
.tabletitle {
    margin: 0 10px 10px 10px;
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

