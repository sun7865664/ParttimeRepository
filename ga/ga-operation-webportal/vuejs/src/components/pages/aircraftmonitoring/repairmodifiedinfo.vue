<template>
    <div id="repairmodifiedinfo" style="width: 1280px; height:auto; margin-top: 30px;display: inline-block;background: white;padding: 40px 20px;margin-bottom:16px;">
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
                            <span>记录编号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.id}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>公司名称</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.companyName}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>航空器制造厂家</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.aircraftManufacturer}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>航空器型号</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.aircraftModel}}</span>
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
                            <span>{{repairmodifiedinfo.aircraftRegNo}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>所有人名称</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.possessor}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>地址</span>
                        </div>
                    </td>
                    <td colspan="3">
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.address}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>类型</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.type}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>项目</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.project}}</span>
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
                            <span>{{repairmodifiedinfo.releaser}}</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>放行时间</span>
                        </div>
                    </td>
                    <td>
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.releaseTime}}</span>
                        </div>
                    </td>
                </tr>
                <tr class="ivu-table-row">
                    <td>
                        <div class="ivu-table-cell">
                            <span>维修工作概述</span>
                        </div>
                    </td>
                    <td colspan="3">
                        <div class="ivu-table-cell">
                            <span>{{repairmodifiedinfo.mcSummary}}</span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script>
export default {
  name: "repairmodifiedinfo",
  props: ['id'],
  data() {
    return {
      repairmodifiedinfo: {}
    };
  },
  created: function() {
      
      this.repairmodifiedinfo = {
        id: "",
        companyName: "",
        aircraftManufacturer,
        aircraftModel: "",
        aircraftRegNo: "",
        possessor: "",
        address: "",
        type: "",
        project: "",
        releaser: "",
        releaseTime: "",
        mcSummary: "",
      };
  },
  methods: {
    onclose: function() {
       this.$router.push({path:'/aircraftmonitoring/tabs',query: {value:'repairmodified' }})
    }
  }
};
</script>


<style>
#repairmodifiedinfo table td {
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

