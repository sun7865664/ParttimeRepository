<template>
  <div  class="com-wrap-1190 wrap">
    <div>
      <header class="header">
        <a href="/home" class="operation-logo" style="float: left"></a>
        <div class="user">
          <div style="float: right; margin-top: 24px">
            <Dropdown trigger="click" style="margin-left: 4px; margin-right: 30px">
              <a href="javascript:void(0)">
                <span style="color:#8E9396;">{{username}} </span>
                <Icon type="ios-arrow-down" style="color:#8E9396"></Icon>
              </a>
              <DropdownMenu slot="list">
                <DropdownItem>
                    <span style="color:#8E9396">修改密码</span>
                </DropdownItem>
                <DropdownItem>
                  <a @click="logout"><span style="color:#8E9396">退出</span></a>
                </DropdownItem>
              </DropdownMenu>
            </Dropdown>
          </div>
          <div style="float: right; margin-top: 15px">
            <Avatar icon="ios-person" size="large" style="background-color: #C7DBEA;"></Avatar>
          </div>
        </div>
      </header>
    </div>
    <div class="left-nav">
      <shrinkable-menu :menu-list="menuList">
      </shrinkable-menu>
    </div>
    <div style="float:left; margin-left: 30px">
        <router-view></router-view>
    </div>
  </div>
</template>

<script>
import shrinkableMenu from "./main-components/shrinkable-menu/shrinkable-menu.vue";
import messageTip from "./main-components/message-tip.vue";
import Cookies from "js-cookie";
import util from "@/libs/util.js";

export default {
  components: {
    shrinkableMenu,
    messageTip,
  },
  data() {
    return {
      shrink: false,
      username: "",
      userId: "",
      isFullScreen: false,
      openedSubmenuArr: this.$store.state.app.openedSubmenuArr
    };
  },
  computed: {
    //菜单
    menuList() {
      return this.$store.state.app.menuList;
    },
    avatarPath() {
      return localStorage.avatorImgPath;
    },
    cachePage() {
      return this.$store.state.app.cachePage;
    }
  },
  stompClient: {
    monitorIntervalTime: 100,
    stompReconnect: true,
    timeout(orgCmd) {}
  },
  methods: {
    init() {
      let userInfo = JSON.parse(Cookies.get("userInfo"));
      this.username = userInfo.username;
      this.userId = userInfo.id;
    },
    logout: function () {
        this.$store.commit("logout", this);
        // 强制刷新页面 重新加载router
        location.reload();
    }
  },
  watch: {
    $route(to) {
      this.$store.commit("setCurrentPageName", to.name);
      let pathArr = util.setCurrentPath(this, to.name);
      if (pathArr.length > 2) {
        this.$store.commit("addOpenSubmenu", pathArr[1].name);
      }
      localStorage.currentPageName = to.name;
    }
  },
  mounted() {
    this.init();
    window.addEventListener("resize", this.scrollBarResize);
  },
  created() {
    // 显示打开的页面的列表
    this.$store.commit("setOpenedList");
  },
  dispatch() {
    window.removeEventListener("resize", this.scrollBarResize);
  }
};
</script>
