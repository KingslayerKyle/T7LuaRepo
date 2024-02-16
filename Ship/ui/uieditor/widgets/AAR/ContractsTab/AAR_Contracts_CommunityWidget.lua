-- dc30b31c103e82d699ca743f40b1b88d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_timer" )
require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_PercentCompleteWidgetWithPips" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = function ()
		f1_arg0.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, GetPromoCircleFill( f1_arg1, 0, 0, 0, 0 ) )
		f1_arg0.PercentCompleteWidget.percentText:setText( Engine.Localize( GetPromoCirclePercentText( "MPUI_PERCENT" ) ) )
	end
	
	if CoD.GetThermometerProgress() >= 0 then
		f1_local0()
	else
		f1_arg0.thermometerUpdateTimer = LUI.UITimer.newElementTimer( 2000, false, function ( f3_arg0 )
			if CoD.GetThermometerProgress() >= 0 then
				f1_local0()
				if f1_arg0.thermometerUpdateTimer then
					f1_arg0.thermometerUpdateTimer:close()
					f1_arg0.thermometerUpdateTimer = nil
				end
			end
		end )
		f1_arg0:addElement( f1_arg0.thermometerUpdateTimer )
	end
end

CoD.AAR_Contracts_CommunityWidget = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_CommunityWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_CommunityWidget )
	self.id = "AAR_Contracts_CommunityWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 384 )
	self:setTopBottom( true, false, 0, 211 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, -2 )
	FEButtonPanel0:setTopBottom( true, false, 2, 32.5 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local BMContractsAARtitle = CoD.AAR_Contracts_timer.new( menu, controller )
	BMContractsAARtitle:setLeftRight( true, false, 9, 176.5 )
	BMContractsAARtitle:setTopBottom( true, false, 7, 26 )
	BMContractsAARtitle.Weekly:setText( Engine.Localize( "MENU_TAB_COMMUNITY_CAPS" ) )
	BMContractsAARtitle.Timer:setText( Engine.Localize( "$(contractDailyRemaining)" ) )
	BMContractsAARtitle:mergeStateConditions( {
		{
			stateName = "HideTimer",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( BMContractsAARtitle )
	self.BMContractsAARtitle = BMContractsAARtitle
	
	local PercentCompleteWidget = CoD.AAR_Contracts_PercentCompleteWidgetWithPips.new( menu, controller )
	PercentCompleteWidget:setLeftRight( true, false, 5, 95 )
	PercentCompleteWidget:setTopBottom( true, false, 38.06, 128.06 )
	PercentCompleteWidget:setScale( 0.9 )
	PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, 0, 0, 0, 0 )
	PercentCompleteWidget.percentText:setText( Engine.Localize( "" ) )
	PercentCompleteWidget:mergeStateConditions( {
		{
			stateName = "TwoPips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ThreePips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "FourPips",
			condition = function ( menu, element, event )
				return not IsThermometerProgressEqualTo( 1 )
			end
		},
		{
			stateName = "CompleteZeroPips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CompleteTwoPips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CompleteThreePips",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CompleteFourPips",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		}
	} )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local SpecialContractName = LUI.UIText.new()
	SpecialContractName:setLeftRight( true, false, 109.5, 364.5 )
	SpecialContractName:setTopBottom( true, false, 56.06, 75.06 )
	SpecialContractName:setRGB( 0.94, 0.89, 0.59 )
	SpecialContractName:setText( Engine.Localize( "MPUI_CONTRACTS_SPECIAL_TITLE_CAPS" ) )
	SpecialContractName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	SpecialContractName:setLetterSpacing( -0.5 )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractName )
	self.SpecialContractName = SpecialContractName
	
	local SpecialContractDesc = LUI.UIText.new()
	SpecialContractDesc:setLeftRight( true, false, 110.5, 353.5 )
	SpecialContractDesc:setTopBottom( true, false, 77.06, 95.06 )
	SpecialContractDesc:setRGB( 0.75, 0.75, 0.75 )
	SpecialContractDesc:setText( "" )
	SpecialContractDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SpecialContractDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialContractDesc )
	self.SpecialContractDesc = SpecialContractDesc
	
	local CategoryListLine000 = LUI.UIImage.new()
	CategoryListLine000:setLeftRight( true, false, 71, 336 )
	CategoryListLine000:setTopBottom( true, false, 130, 134 )
	CategoryListLine000:setAlpha( 0.25 )
	CategoryListLine000:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine000 )
	self.CategoryListLine000 = CategoryListLine000
	
	local CompletedIcon = LUI.UIImage.new()
	CompletedIcon:setLeftRight( false, true, -43, 6 )
	CompletedIcon:setTopBottom( true, false, 1, 33 )
	CompletedIcon:setAlpha( 0 )
	CompletedIcon:setImage( RegisterImage( "uie_t7_bm_contracts_completed_ribbon" ) )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				SpecialContractName:completeAnimation()
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )

				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0.25 )
				self.clipFinished( CategoryListLine000, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setAlpha( 0 )
				self.clipFinished( CompletedIcon, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )

				SpecialContractName:completeAnimation()
				self.SpecialContractName:setAlpha( 1 )
				self.clipFinished( SpecialContractName, {} )

				SpecialContractDesc:completeAnimation()
				self.SpecialContractDesc:setAlpha( 1 )
				self.clipFinished( SpecialContractDesc, {} )

				CategoryListLine000:completeAnimation()
				self.CategoryListLine000:setAlpha( 0.25 )
				self.clipFinished( CategoryListLine000, {} )

				CompletedIcon:completeAnimation()
				self.CompletedIcon:setLeftRight( false, true, -44, 5 )
				self.CompletedIcon:setTopBottom( true, false, 1, 33 )
				self.CompletedIcon:setAlpha( 1 )
				self.clipFinished( CompletedIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.BMContractsAARtitle:close()
		element.PercentCompleteWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
