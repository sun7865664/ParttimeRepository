<style>
    .bottom5 {
        margin-bottom: 24px;
    }
</style>
<template>
    <div style="border:1px solid rgba(1,107,217,.5);background-color:rgba(193,220,248,.5);">
    <h2 style="color: #657180;">执照信息</h2>
    <Row>
        <Col :md="12">
        <FormItem label="执照状态" class="bottom5">
            <Select v-model="flightdispatcher.licenseState" placeholder="请选择">
                <Option value="在用">在用</Option>
                <Option value="作废">作废</Option>
            </Select>
        </FormItem>
        </Col>
        <Col :md="11">
        <FormItem label="执照类型" class="bottom5" >
            <Select v-model="flightdispatcher.licenseProp" placeholder="请选择">
                <Option value="临时">临时</Option>
                <Option value="永久">永久</Option>
            </Select>
        </FormItem>
        </Col>
    </Row>

    <Row>
        <Col :md="12">
        <FormItem label="执照颁发人" class="bottom5">
            <Input v-model="flightdispatcher.holderName" placeholder="请输入执照颁发人"></Input>
        </FormItem>
        </Col>
        <Col :md="11">
        <FormItem label="持证人执业公司" class="bottom5" >
            <Input v-model="flightdispatcher.companyId" placeholder="请输入持证人执业公司ID"></Input>
        </FormItem>
        </Col>
    </Row>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                flightdispatcher: {
                    id: '',
                    licenseState: '',
                    licenseProp: '',
                    holderName: '',
                    companyId: '',
                },
            }
        },
        methods: {
        },

    }
</script>