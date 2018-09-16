<style>
    .bottom5 {
        margin-bottom: 15px;
    }
</style>
<template>
    <div style="border:1px solid rgba(1,107,217,.5);background-color:rgba(193,220,248,.5);">
        <h2 style="color: #657180;">执照信息</h2>
    <Row>
        <Col :md="12">
        <FormItem label="执照颁发单位" class="bottom5">
            <Input v-model="intelligencelicense.issueUnit" placeholder="请输入执照颁发单位"></Input>
        </FormItem>
        </Col>
    </Row>
        <Row>
        <Col :md="24">
        <FormItem label="执照适用地区" class="bottom5" style="color:#657180" >
            <CheckboxGroup v-model="businesslist">
                <Checkbox label="华北">
                    <span>华北</span>
                </Checkbox>
                <Checkbox label="东北">
                    <span>东北</span>
                </Checkbox>
                <Checkbox label="华东">
                    <span>华东</span>
                </Checkbox>
                <Checkbox label="中南">
                    <span>中南</span>
                </Checkbox>
                <Checkbox label="西南">
                    <span>西南</span>
                </Checkbox>
                <Checkbox label="西北">
                    <span>西北</span>
                </Checkbox>
                <Checkbox label="新疆">
                    <span>新疆</span>
                </Checkbox>
            </CheckboxGroup>
        </FormItem>
        </Col>
        </Row>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                intelligencelicense: {
                    id: '',
                    issueUnit:'',
                    licenseArea:'',

                },
                businesslist:[]
            }
        },
    }
</script>