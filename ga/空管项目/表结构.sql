/*
Navicat MySQL Data Transfer

Source Server         : 222.182.202.111
Source Server Version : 50610
Source Host           : 222.182.202.111:5505
Source Database       : mmis

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2018-09-15 16:56:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mmis_mc_cannr_apply`
-- ----------------------------
DROP TABLE IF EXISTS `mmis_mc_cannr_apply`;
CREATE TABLE `mmis_mc_cannr_apply` (
  `id` varchar(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `proc_id` varchar(32) DEFAULT NULL COMMENT '流程id',
  `attachment_ids` varchar(250) DEFAULT NULL COMMENT '附件',
  `company_id` varchar(32) DEFAULT NULL COMMENT '组织id',
  `no` varchar(32) NOT NULL COMMENT '串件申请记录单编号',
  `broken_aircraft_model` varchar(8) DEFAULT NULL COMMENT '故障件航空器型号',
  `broken_aircraft_reg_no` varchar(32) DEFAULT NULL COMMENT '故障件航空器注册号',
  `broken_name` varchar(200) DEFAULT NULL COMMENT '故障件名称',
  `broken_part_no` varchar(32) DEFAULT NULL COMMENT '故障件件号',
  `broken_serial_no` varchar(32) DEFAULT NULL COMMENT '故障件序号',
  `cannr_aircraft_model` varchar(8) DEFAULT NULL COMMENT '串件航空器型号',
  `cannr_aircraft_reg_no` varchar(32) DEFAULT NULL COMMENT '串件航空器注册号',
  `cannr_name` varchar(200) DEFAULT NULL COMMENT '串件件名称',
  `cannr_serial_no` varchar(32) DEFAULT NULL COMMENT '串件件序号',
  `cannr_part_no` varchar(32) DEFAULT NULL COMMENT '串件件件号',
  `section` varchar(8) DEFAULT NULL COMMENT '涉及章节号',
  `replace_part_reason` varchar(250) DEFAULT NULL COMMENT '串件原因描述',
  `applicant` varchar(32) NOT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `complete` varchar(32) NOT NULL COMMENT '完成人',
  `complete_time` datetime NOT NULL COMMENT '完成时间',
  `status` varchar(8) DEFAULT NULL COMMENT '串件处理状态',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除标志位 1删除 0未删',
  `approver` varchar(32) DEFAULT NULL COMMENT '审批人',
  `approve_time` datetime DEFAULT NULL COMMENT '审核时间',
  `revisor` varchar(32) DEFAULT NULL COMMENT '更新人',
  `revisor_name` varchar(64) DEFAULT NULL COMMENT '更新人姓名',
  `revise_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='串件申请记录';

-- ----------------------------
-- Records of mmis_mc_cannr_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `mmis_mc_fault_record_list`
-- ----------------------------
DROP TABLE IF EXISTS `mmis_mc_fault_record_list`;
CREATE TABLE `mmis_mc_fault_record_list` (
  `id` varchar(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `proc_id` varchar(32) DEFAULT NULL COMMENT '流程id',
  `attachment_ids` varchar(250) DEFAULT NULL COMMENT '附件',
  `company_id` varchar(32) DEFAULT NULL COMMENT '组织id',
  `no` varchar(32) NOT NULL COMMENT '故障保留单编号',
  `status` varchar(8) NOT NULL COMMENT '保留处理状态',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除标志位 1删除 0未删',
  `approver` varchar(64) DEFAULT NULL,
  `approve_time` datetime DEFAULT NULL,
  `fault_describe` varchar(250) NOT NULL COMMENT '发现的故障',
  `discovery` varchar(20) DEFAULT NULL COMMENT '发现人',
  `deal_with` varchar(200) DEFAULT NULL COMMENT '处理措施',
  `deal_who` varchar(20) DEFAULT NULL COMMENT '处理人',
  `is_reserve` tinyint(1) DEFAULT '0' COMMENT '是否保留',
  `parent_type` varchar(8) DEFAULT NULL COMMENT '主键类型',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '主键id',
  `parent_no` varchar(32) DEFAULT NULL COMMENT '主表编号',
  `revisor` varchar(32) DEFAULT NULL COMMENT '更新人',
  `revisor_name` varchar(64) DEFAULT NULL COMMENT '更新人姓名',
  `revise_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='故障保留单';

-- ----------------------------
-- Records of mmis_mc_fault_record_list
-- ----------------------------

-- ----------------------------
-- Table structure for `mmis_mc_fault_reserve`
-- ----------------------------
DROP TABLE IF EXISTS `mmis_mc_fault_reserve`;
CREATE TABLE `mmis_mc_fault_reserve` (
  `id` varchar(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `proc_id` varchar(32) DEFAULT NULL COMMENT '流程id',
  `attachment_ids` varchar(250) DEFAULT NULL COMMENT '附件',
  `company_id` varchar(32) DEFAULT NULL COMMENT '组织id',
  `fault_describe` varchar(250) NOT NULL COMMENT '保留故障描述',
  `ata_section` varchar(32) DEFAULT NULL COMMENT 'ATA章节号',
  `measures_taken` varchar(250) NOT NULL COMMENT '已采取措施',
  `no` varchar(32) NOT NULL COMMENT '故障保留单编号',
  `reserve_company` varchar(200) DEFAULT NULL COMMENT '保留单位',
  `fault_reserve_cause` varchar(250) DEFAULT NULL COMMENT '保留故障原因',
  `reserve_basis` varchar(250) NOT NULL COMMENT '保留依据',
  `reserve_date` date NOT NULL COMMENT '保留期限',
  `apply` varchar(32) NOT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `completor` varchar(32) DEFAULT NULL COMMENT '完成人ID',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `status` varchar(8) NOT NULL COMMENT '保留处理状态',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除标志位 1删除 0未删',
  `aircraft_model` varchar(8) DEFAULT NULL COMMENT '航空器型号',
  `aircraft_id` varchar(32) DEFAULT NULL COMMENT '航空器ID',
  `aircraft_reg_no` varchar(32) DEFAULT NULL COMMENT '航空器信息注册号',
  `approver` varchar(64) DEFAULT NULL,
  `approve_time` datetime DEFAULT NULL,
  `color` varchar(8) DEFAULT NULL COMMENT '高亮显示',
  `revisor` varchar(32) DEFAULT NULL COMMENT '更新人',
  `revisor_name` varchar(64) DEFAULT NULL COMMENT '更新人姓名',
  `revise_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='故障保留单';

-- ----------------------------
-- Records of mmis_mc_fault_reserve
-- ----------------------------

-- ----------------------------
-- Table structure for `mmis_mc_flight_record`
-- ----------------------------
DROP TABLE IF EXISTS `mmis_mc_flight_record`;
CREATE TABLE `mmis_mc_flight_record` (
  `id` varchar(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `proc_id` varchar(32) DEFAULT NULL COMMENT '流程id',
  `attachment_ids` varchar(250) DEFAULT NULL COMMENT '附件',
  `company_name` varchar(250) DEFAULT NULL COMMENT '公司名称',
  `company_id` varchar(32) DEFAULT NULL COMMENT '组织id',
  `status` varchar(8) NOT NULL COMMENT '飞行记录本处理状态',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除标志位 1删除 0未删',
  `no` varchar(32) NOT NULL COMMENT '飞行记录本编号',
  `engine1_id` varchar(32) DEFAULT NULL COMMENT '发动机1ID',
  `engine1_serial_no` varchar(32) DEFAULT NULL COMMENT '发动机1序列号',
  `loop1` varchar(10) DEFAULT NULL COMMENT '发动机1循环数（单发选择）',
  `loop2` varchar(10) DEFAULT NULL COMMENT '发动机2循环数',
  `rise_fall` varchar(32) NOT NULL COMMENT '起落次数',
  `captain` varchar(32) NOT NULL COMMENT '机长ID',
  `releaser` varchar(32) NOT NULL COMMENT '放行人员ID',
  `release_time` datetime NOT NULL COMMENT '放行时间',
  `detrusion_time` datetime DEFAULT NULL COMMENT '推出时刻',
  `take_off_time` datetime DEFAULT NULL COMMENT '起飞时刻',
  `land_time` datetime DEFAULT NULL COMMENT '降落时刻',
  `close_time` datetime DEFAULT NULL COMMENT '关车时刻',
  `fuel` varchar(32) DEFAULT NULL COMMENT '总燃油量',
  `add_fuel` varchar(32) DEFAULT NULL COMMENT '燃油添加量',
  `surplus_fuel` varchar(32) DEFAULT NULL COMMENT '剩余燃油量',
  `aircraft_model` varchar(8) DEFAULT NULL COMMENT '航空器型号',
  `aircraft_id` varchar(32) DEFAULT NULL COMMENT '航空器ID',
  `aircraft_reg_no` varchar(32) DEFAULT NULL COMMENT '航空器信息注册号',
  `aircraft_fly_time` varchar(32) NOT NULL COMMENT '航空器飞行时间',
  `work_record` varchar(500) DEFAULT NULL COMMENT '工作记录',
  `revisor` varchar(32) DEFAULT NULL COMMENT '更新人',
  `revisor_name` varchar(64) DEFAULT NULL COMMENT '更新人姓名',
  `revise_time` datetime DEFAULT NULL COMMENT '更新时间',
  `engine2_id` varchar(32) DEFAULT NULL COMMENT '发动机2ID',
  `engine2_serial_no` varchar(32) DEFAULT NULL COMMENT '发动机2序列号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='飞行记录本';

-- ----------------------------
-- Records of mmis_mc_flight_record
-- ----------------------------

-- ----------------------------
-- Table structure for `mmis_mc_repair_modified`
-- ----------------------------
DROP TABLE IF EXISTS `mmis_mc_repair_modified`;
CREATE TABLE `mmis_mc_repair_modified` (
  `id` varchar(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `proc_id` varchar(32) DEFAULT NULL COMMENT '流程id',
  `attachment_ids` varchar(250) DEFAULT NULL COMMENT '附件',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除标志位 1删除 0未删',
  `status` varchar(8) DEFAULT NULL COMMENT '记录处理状态',
  `company_id` varchar(32) DEFAULT NULL COMMENT '组织id',
  `no` varchar(32) DEFAULT NULL COMMENT '重要修理及改装记录编号',
  `company_name` varchar(300) DEFAULT NULL COMMENT '公司名称',
  `aircraft_manufacturer` varchar(300) DEFAULT NULL COMMENT '航空器制造厂家',
  `aircraft_model` varchar(8) DEFAULT NULL COMMENT '航空器型号',
  `aircraft_id` varchar(32) DEFAULT NULL COMMENT '航空器ID',
  `aircraft_serial_no` varchar(32) DEFAULT NULL COMMENT '航空器序列号',
  `possessor` varchar(32) DEFAULT NULL COMMENT '所有人名称',
  `address` varchar(300) DEFAULT NULL COMMENT '地址',
  `type` varchar(8) DEFAULT NULL COMMENT '类型',
  `project` varchar(8) DEFAULT NULL COMMENT '项目',
  `releaser` varchar(20) DEFAULT NULL COMMENT '放行人',
  `release_time` varchar(20) DEFAULT NULL COMMENT '放行时间',
  `revisor` varchar(32) DEFAULT NULL COMMENT '更新人',
  `revisor_name` varchar(64) DEFAULT NULL COMMENT '更新人姓名',
  `revise_time` datetime DEFAULT NULL COMMENT '更新时间',
  `mc_summary` varchar(300) DEFAULT NULL COMMENT '维修工作概述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='重要修理及改装管理';

-- ----------------------------
-- Records of mmis_mc_repair_modified
-- ----------------------------

-- ----------------------------
-- Table structure for `mmis_mc_replace_record_list`
-- ----------------------------
DROP TABLE IF EXISTS `mmis_mc_replace_record_list`;
CREATE TABLE `mmis_mc_replace_record_list` (
  `id` varchar(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `proc_id` varchar(32) DEFAULT NULL COMMENT '流程id',
  `attachment_ids` varchar(250) DEFAULT NULL COMMENT '附件',
  `company_id` varchar(32) DEFAULT NULL COMMENT '组织id',
  `parts_type` varchar(8) DEFAULT NULL COMMENT '部件类型',
  `broken_name` varchar(200) DEFAULT NULL COMMENT '故障件名称',
  `broken_part_no` varchar(32) DEFAULT NULL COMMENT '故障件件号',
  `broken_serial_no` varchar(32) DEFAULT NULL COMMENT '故障件序号',
  `install_name` varchar(200) DEFAULT NULL COMMENT '串件件名称',
  `install_serial_no` varchar(32) DEFAULT NULL COMMENT '串件件序号',
  `install_part_no` varchar(32) DEFAULT NULL COMMENT '串件件件号',
  `status` varchar(8) DEFAULT NULL COMMENT '串件处理状态',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除标志位 1删除 0未删',
  `parent_type` varchar(8) DEFAULT NULL COMMENT '主键类型',
  `parent_no` varchar(32) DEFAULT NULL COMMENT '主表编号',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '主键id',
  `install_part_certificate` varchar(32) DEFAULT NULL COMMENT '安装航材合格证',
  `revisor` varchar(32) DEFAULT NULL COMMENT '更新人',
  `revisor_name` varchar(64) DEFAULT NULL COMMENT '更新人姓名',
  `revise_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='换件记录';

-- ----------------------------
-- Records of mmis_mc_replace_record_list
-- ----------------------------

-- ----------------------------
-- Table structure for `mmis_mc_work_reserve`
-- ----------------------------
DROP TABLE IF EXISTS `mmis_mc_work_reserve`;
CREATE TABLE `mmis_mc_work_reserve` (
  `id` varchar(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator_name` varchar(64) DEFAULT NULL COMMENT '创建者姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `proc_id` varchar(32) DEFAULT NULL COMMENT '流程id',
  `attachment_ids` varchar(250) DEFAULT NULL COMMENT '附件',
  `company_id` varchar(32) DEFAULT NULL COMMENT '组织id',
  `no` varchar(32) NOT NULL COMMENT '工作保留单编号',
  `delay_reason` varchar(250) DEFAULT NULL COMMENT '推迟原因',
  `delay_basis` varchar(250) NOT NULL COMMENT '推迟依据',
  `delay_date` date NOT NULL COMMENT '推迟期限',
  `applicant` varchar(32) NOT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `completor` varchar(32) DEFAULT NULL COMMENT '完成人',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `status` varchar(8) NOT NULL COMMENT '保留处理状态',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名字',
  `woc_no` varchar(32) DEFAULT NULL COMMENT '工作单卡编号',
  `woc_title` varchar(250) DEFAULT NULL COMMENT '工作单卡标题',
  `woc_id` varchar(32) DEFAULT NULL COMMENT '工卡ID',
  `approver` varchar(64) DEFAULT NULL COMMENT '审批人',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除标志位 1删除 0未删',
  `aircraft_model` varchar(8) DEFAULT NULL COMMENT '航空器型号',
  `aircraft_reg_no` varchar(32) DEFAULT NULL COMMENT '航空器信息注册号',
  `color` varchar(8) DEFAULT NULL COMMENT '高亮显示',
  `revisor` varchar(32) DEFAULT NULL COMMENT '更新人',
  `revisor_name` varchar(64) DEFAULT NULL COMMENT '更新人姓名',
  `revise_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='工作保留单';

-- ----------------------------
-- Records of mmis_mc_work_reserve
-- ----------------------------
