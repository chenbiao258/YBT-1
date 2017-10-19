Ext.onReady(function() {
			Ext.QuickTips.init();
			var mainTab = new Ext.TabPanel({
				id : 'mainTab',
				region : 'center',
				enableTabScroll : true,
				activeTab : 0,
				items : [ {
					id : 'infomation',
					title : '首页',
					contentEl : 'center',
					autoScroll : true
				} ]
			});

			var store = Ext.create('Ext.data.TreeStore',{
				proxy : {
					type : 'ajax',
					url : path + '/servlet/menuServlet?method=getUserMenu&userCode=admin',
					listeners : {
						exception : function(o, options,response, typeError) {
										loadException(response, typeError);
									}
								}
					},
					root : {
						id : '0',
						text : '银保E服务平台',
						expanded : true
					}
			});

			var menuTree = new Ext.tree.TreePanel({
				lines : true,
				store : store,
				listeners : {
					itemclick : function(view, record, item, index, e, eOpts) {

						if (record.hasChildNodes()) {
							return;
						}
						var tabId = record.data.id;

						if (mainTab != null) {
							var tTabItem = Ext.getCmp(tabId);
							
							if (tTabItem == null || tTabItem == 'undefined') {
								tTabItem = mainTab.add(new Ext.ux.IFrame({
									id : record.data.id,
									frameName:record.data.hrefTarget,
									title : record.data.text,
									closable : true,
									iconCls: record.data.iconCls,
									layout : 'fit',
									border : false
								}));
								mainTab.setActiveTab(tTabItem);
							}
							else{
								mainTab.setActiveTab(tTabItem);
							}		
						}
					}
				},
				region : 'west',
				title : '菜单',
				split : true,
				border : true,
				collapsible : true,
				width : 180,
				minWidth : 80,
				maxWidth : 250
			});

			var viewport = new Ext.Viewport({
				layout : 'border',
				items : [ {
					region : 'north',
					contentEl : 'north'
				}, menuTree, mainTab,{
					region : 'south',
					contentEl : 'south'
				} ]
			});
		});


/**
 * 用户退出
 */
function logout(){
	window.location = path + "/login/logOff.do";
}