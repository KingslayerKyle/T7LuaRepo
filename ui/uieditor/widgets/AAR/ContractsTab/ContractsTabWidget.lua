-- faf423fd8e3e78d2e360bd22506465ee
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Common.common_PanelBox01" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_BlackjackInfoWidget" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_WeeklyContractsWidget" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_DailyContractWidget" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_SpecialContractWidget" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_CommunityWidget" )

local PreLoadFunc = function ( self, controller )
	self:registerEventHandler( "contracts_time_remaining_tick", function ( element, event )
		LuaUtils.CycleContracts()
	end )
	self:addElement( LUI.UITimer.new( 250, "contracts_time_remaining_tick", false, self ) )
	LuaUtils.CycleContracts()
end

CoD.ContractsTabWidget = InheritFrom( LUI.UIElement )
CoD.ContractsTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ContractsTabWidget )
	self.id = "ContractsTabWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 550 )
	self.anyChildUsesUpdateState = true
	
	local commonPanelBox01 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox01:setLeftRight( true, false, 33, 309 )
	commonPanelBox01:setTopBottom( true, false, 234, 532.59 )
	commonPanelBox01.Backing:setAlpha( 0.05 )
	commonPanelBox01.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox01 )
	self.commonPanelBox01 = commonPanelBox01
	
	local commonPanelBox02 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox02:setLeftRight( true, false, 319, 818 )
	commonPanelBox02:setTopBottom( true, false, 234, 532.59 )
	commonPanelBox02.Backing:setAlpha( 0.05 )
	commonPanelBox02.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox02 )
	self.commonPanelBox02 = commonPanelBox02
	
	local commonPanelBox03 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox03:setLeftRight( true, false, 828, 1246 )
	commonPanelBox03:setTopBottom( true, false, 12, 533 )
	commonPanelBox03.Backing:setAlpha( 0.05 )
	commonPanelBox03.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox03 )
	self.commonPanelBox03 = commonPanelBox03
	
	local commonPanelBox030 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox030:setLeftRight( true, false, 33, 818 )
	commonPanelBox030:setTopBottom( true, false, 11.59, 224 )
	commonPanelBox030.Backing:setAlpha( 0.05 )
	commonPanelBox030.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox030 )
	self.commonPanelBox030 = commonPanelBox030
	
	local commonPanelBox031 = CoD.common_PanelBox01.new( menu, controller )
	commonPanelBox031:setLeftRight( true, false, 33, 420 )
	commonPanelBox031:setTopBottom( true, false, 11.59, 224 )
	commonPanelBox031:setAlpha( 0 )
	commonPanelBox031.Backing:setAlpha( 0.05 )
	commonPanelBox031.Image:setAlpha( 0.25 )
	self:addElement( commonPanelBox031 )
	self.commonPanelBox031 = commonPanelBox031
	
	local BlackjackInfo = CoD.AAR_Contracts_BlackjackInfoWidget.new( menu, controller )
	BlackjackInfo:setLeftRight( true, false, 830, 1244 )
	BlackjackInfo:setTopBottom( true, false, 13, 530 )
	BlackjackInfo.BMContractsAARtitle.SubTitle:setText( Engine.Localize( "MPUI_BM_CONTRACT_BLACKJACK" ) )
	self:addElement( BlackjackInfo )
	self.BlackjackInfo = BlackjackInfo
	
	local WeeklyContractsWidget = CoD.AAR_Contracts_WeeklyContractsWidget.new( menu, controller )
	WeeklyContractsWidget:setLeftRight( true, false, 321, 818 )
	WeeklyContractsWidget:setTopBottom( true, false, 234, 530 )
	self:addElement( WeeklyContractsWidget )
	self.WeeklyContractsWidget = WeeklyContractsWidget
	
	local DailyContractWidget = CoD.AAR_Contracts_DailyContractWidget.new( menu, controller )
	DailyContractWidget:setLeftRight( true, false, 36, 308 )
	DailyContractWidget:setTopBottom( true, false, 234, 530 )
	self:addElement( DailyContractWidget )
	self.DailyContractWidget = DailyContractWidget
	
	local SpecialContractWidget = CoD.AAR_Contracts_SpecialContractWidget.new( menu, controller )
	SpecialContractWidget:setLeftRight( true, false, 35, 817 )
	SpecialContractWidget:setTopBottom( true, false, 13, 224 )
	SpecialContractWidget.BMContractsAARtitle.SubTitle:setText( Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL" ) )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "percentComplete", function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			SpecialContractWidget.SpecialContractPercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( percentComplete, 1 ), CoD.GetVectorComponentFromString( percentComplete, 2 ), CoD.GetVectorComponentFromString( percentComplete, 3 ), CoD.GetVectorComponentFromString( percentComplete, 4 ) )
		end
	end )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "fractionText", function ( model )
		local fractionText = Engine.GetModelValue( model )
		if fractionText then
			SpecialContractWidget.SpecialContractPercentCompleteWidget.percentText:setText( Engine.Localize( fractionText ) )
		end
	end )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			SpecialContractWidget.SpecialContractName:setText( Engine.Localize( name ) )
		end
	end )
	SpecialContractWidget:subscribeToGlobalModel( controller, "CurrentSpecialContract", "description", function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			SpecialContractWidget.SpecialContractDesc:setText( Engine.Localize( description ) )
		end
	end )
	SpecialContractWidget:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "enable_weapon_contract", false )
			end
		},
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "ui_enablePromoMenu", false ) and IsModelValueTrue( controller, "CurrentSpecialContract.isComplete" )
			end
		},
		{
			stateName = "CompletedShort",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	SpecialContractWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CurrentSpecialContract.isComplete" ), function ( model )
		menu:updateElementState( SpecialContractWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CurrentSpecialContract.isComplete"
		} )
	end )
	self:addElement( SpecialContractWidget )
	self.SpecialContractWidget = SpecialContractWidget
	
	local CommunityWidget = CoD.AAR_Contracts_CommunityWidget.new( menu, controller )
	CommunityWidget:setLeftRight( true, false, 35, 419 )
	CommunityWidget:setTopBottom( true, false, 13, 224 )
	CommunityWidget.SpecialContractName:setText( LocalizeToUpperString( "CONTRACT_COMMUNITY_TITLE_ROADTOCHAMPS" ) )
	CommunityWidget.SpecialContractDesc:setText( Engine.Localize( "MPUI_CONTRACTS_RTC_DESC" ) )
	self:addElement( CommunityWidget )
	self.CommunityWidget = CommunityWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				commonPanelBox01:completeAnimation()
				self.commonPanelBox01:setLeftRight( true, false, 33, 309 )
				self.commonPanelBox01:setTopBottom( true, false, 206, 532.59 )
				self.clipFinished( commonPanelBox01, {} )

				commonPanelBox02:completeAnimation()
				self.commonPanelBox02:setLeftRight( true, false, 319, 818 )
				self.commonPanelBox02:setTopBottom( true, false, 206, 532.59 )
				self.clipFinished( commonPanelBox02, {} )

				commonPanelBox030:completeAnimation()
				self.commonPanelBox030:setLeftRight( true, false, 33, 818 )
				self.commonPanelBox030:setTopBottom( true, false, 11.59, 196 )
				self.clipFinished( commonPanelBox030, {} )

				commonPanelBox031:completeAnimation()
				self.commonPanelBox031:setAlpha( 0 )
				self.clipFinished( commonPanelBox031, {} )

				WeeklyContractsWidget:completeAnimation()
				self.WeeklyContractsWidget:setLeftRight( true, false, 321, 818 )
				self.WeeklyContractsWidget:setTopBottom( true, false, 206, 530 )
				self.clipFinished( WeeklyContractsWidget, {} )

				DailyContractWidget:completeAnimation()
				self.DailyContractWidget:setLeftRight( true, false, 36, 308 )
				self.DailyContractWidget:setTopBottom( true, false, 206, 530 )
				self.clipFinished( DailyContractWidget, {} )

				SpecialContractWidget:completeAnimation()
				self.SpecialContractWidget:setLeftRight( true, false, 35, 817 )
				self.SpecialContractWidget:setTopBottom( true, false, 13, 196 )
				self.clipFinished( SpecialContractWidget, {} )

				CommunityWidget:completeAnimation()
				self.CommunityWidget:setAlpha( 0 )
				self.clipFinished( CommunityWidget, {} )
			end
		},
		CommunityVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				commonPanelBox01:completeAnimation()
				self.commonPanelBox01:setLeftRight( true, false, 33, 309 )
				self.commonPanelBox01:setTopBottom( true, false, 237, 532.59 )
				self.clipFinished( commonPanelBox01, {} )

				commonPanelBox02:completeAnimation()
				self.commonPanelBox02:setLeftRight( true, false, 319, 818 )
				self.commonPanelBox02:setTopBottom( true, false, 237, 532.59 )
				self.clipFinished( commonPanelBox02, {} )

				commonPanelBox030:completeAnimation()
				self.commonPanelBox030:setLeftRight( true, false, 431, 818 )
				self.commonPanelBox030:setTopBottom( true, false, 11.59, 226 )
				self.clipFinished( commonPanelBox030, {} )

				commonPanelBox031:completeAnimation()
				self.commonPanelBox031:setLeftRight( true, false, 33, 420 )
				self.commonPanelBox031:setTopBottom( true, false, 11.59, 226 )
				self.commonPanelBox031:setAlpha( 1 )
				self.clipFinished( commonPanelBox031, {} )

				WeeklyContractsWidget:completeAnimation()
				self.WeeklyContractsWidget:setLeftRight( true, false, 321, 818 )
				self.WeeklyContractsWidget:setTopBottom( true, false, 237, 547 )
				self.clipFinished( WeeklyContractsWidget, {} )

				DailyContractWidget:completeAnimation()
				self.DailyContractWidget:setLeftRight( true, false, 35, 309 )
				self.DailyContractWidget:setTopBottom( true, false, 237, 541 )
				self.clipFinished( DailyContractWidget, {} )

				SpecialContractWidget:completeAnimation()
				self.SpecialContractWidget:setLeftRight( true, false, 433, 817 )
				self.SpecialContractWidget:setTopBottom( true, false, 14, 226 )
				self.clipFinished( SpecialContractWidget, {} )

				CommunityWidget:completeAnimation()
				self.CommunityWidget:setLeftRight( true, false, 35, 419 )
				self.CommunityWidget:setTopBottom( true, false, 13, 226 )
				self.CommunityWidget:setAlpha( 1 )
				self.clipFinished( CommunityWidget, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CommunityVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.commonPanelBox01:close()
		element.commonPanelBox02:close()
		element.commonPanelBox03:close()
		element.commonPanelBox030:close()
		element.commonPanelBox031:close()
		element.BlackjackInfo:close()
		element.WeeklyContractsWidget:close()
		element.DailyContractWidget:close()
		element.SpecialContractWidget:close()
		element.CommunityWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

