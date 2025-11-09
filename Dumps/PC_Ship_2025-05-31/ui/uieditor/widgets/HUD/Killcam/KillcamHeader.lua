require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetVignetteTop" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetTitle" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_Main" )
require( "ui.uieditor.widgets.HUD.Killcam.KillcamPerkIcon" )
require( "ui.uieditor.widgets.HUD.Killcam.KillcamKilledBy" )

DataSources.KillcamPerks = DataSourceHelpers.ListSetup( "KillcamPerks", function ( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	local f1_local1 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "perks" )
	if f1_local1 then
		for f1_local2 = 0, CoD.CACUtility.maxPerkCategories - 1, 1 do
			local f1_local5 = Engine.GetModelValue( Engine.GetModel( f1_local1, "perk" .. f1_local2 .. "_count" ) ) or 0
			for f1_local6 = 0, CoD.CACUtility.maxPerksInEachCategory - 1, 1 do
				local f1_local9 = Engine.GetModel( f1_local1, "perk" .. f1_local2 .. "_" .. f1_local6 )
				local f1_local10 = Engine.GetModel( f1_local9, "image" )
				local f1_local11 = Engine.GetModel( f1_local9, "name" )
				if f1_local6 < f1_local5 then
					table.insert( f1_local0, {
						models = {
							image = Engine.GetModelValue( f1_local10 )
						}
					} )
				end
			end
		end
	end
	if f1_arg1.hasPerkSubscriptions ~= true then
		f1_arg1:subscribeToModel( Engine.GetModel( f1_local1, "anyPerkChanged" ), function ()
			f1_arg1:updateDataSource()
		end, false )
		f1_arg1.hasPerkSubscriptions = true
	end
	return f1_local0
end, true )
CoD.KillcamHeader = InheritFrom( LUI.UIElement )
CoD.KillcamHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamHeader )
	self.id = "KillcamHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 128 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( false, false, 19.3, 45.5 )
	bg:setRGB( 0.22, 0.22, 0.22 )
	bg:setAlpha( 0.3 )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( bg )
	self.bg = bg
	
	local KillcamWidgetVignetteTop0 = CoD.KillcamWidgetVignetteTop.new( menu, controller )
	KillcamWidgetVignetteTop0:setLeftRight( true, true, 0, 0 )
	KillcamWidgetVignetteTop0:setTopBottom( false, false, -64, 48 )
	KillcamWidgetVignetteTop0:setAlpha( 0.7 )
	self:addElement( KillcamWidgetVignetteTop0 )
	self.KillcamWidgetVignetteTop0 = KillcamWidgetVignetteTop0
	
	local KillcamWidgetTitle0 = CoD.KillcamWidgetTitle.new( menu, controller )
	KillcamWidgetTitle0:setLeftRight( false, false, -160, 160 )
	KillcamWidgetTitle0:setTopBottom( true, false, 26, 81 )
	KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
	self:addElement( KillcamWidgetTitle0 )
	self.KillcamWidgetTitle0 = KillcamWidgetTitle0
	
	local Glitch = CoD.fxGlitch1_Main.new( menu, controller )
	Glitch:setLeftRight( false, false, -317.5, 239.5 )
	Glitch:setTopBottom( true, false, -32, 175 )
	self:addElement( Glitch )
	self.Glitch = Glitch
	
	local KillcamPerks = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	KillcamPerks:makeFocusable()
	KillcamPerks:setLeftRight( false, false, 265, 563 )
	KillcamPerks:setTopBottom( true, false, 112, 160 )
	KillcamPerks:setDataSource( "KillcamPerks" )
	KillcamPerks:setWidgetType( CoD.KillcamPerkIcon )
	KillcamPerks:setHorizontalCount( 6 )
	self:addElement( KillcamPerks )
	self.KillcamPerks = KillcamPerks
	
	local KillcamKilledBy = CoD.KillcamKilledBy.new( menu, controller )
	KillcamKilledBy:setLeftRight( false, false, 64, 563 )
	KillcamKilledBy:setTopBottom( true, false, 84.5, 109.5 )
	self:addElement( KillcamKilledBy )
	self.KillcamKilledBy = KillcamKilledBy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
				KillcamPerks:completeAnimation()
				self.KillcamPerks:setAlpha( 0 )
				self.clipFinished( KillcamPerks, {} )
				KillcamKilledBy:completeAnimation()
				self.KillcamKilledBy:setAlpha( 0 )
				self.clipFinished( KillcamKilledBy, {} )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
				KillcamPerks:completeAnimation()
				self.KillcamPerks:setAlpha( 1 )
				self.clipFinished( KillcamPerks, {} )
				KillcamKilledBy:completeAnimation()
				self.KillcamKilledBy:setAlpha( 1 )
				self.clipFinished( KillcamKilledBy, {} )
			end
		},
		FinalKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_FINAL_KILLCAM_CAPS" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
				KillcamPerks:completeAnimation()
				self.KillcamPerks:setAlpha( 1 )
				self.clipFinished( KillcamPerks, {} )
				KillcamKilledBy:completeAnimation()
				self.KillcamKilledBy:setAlpha( 1 )
				self.clipFinished( KillcamKilledBy, {} )
			end
		},
		RoundEndingKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_ROUND_END_KILLCAM" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
				KillcamPerks:completeAnimation()
				self.KillcamPerks:setAlpha( 1 )
				self.clipFinished( KillcamPerks, {} )
				KillcamKilledBy:completeAnimation()
				self.KillcamKilledBy:setAlpha( 1 )
				self.clipFinished( KillcamKilledBy, {} )
			end
		},
		NemesisKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				KillcamWidgetTitle0:completeAnimation()
				KillcamWidgetTitle0.KillcamText0:completeAnimation()
				self.KillcamWidgetTitle0.KillcamText0:setText( Engine.Localize( "MP_NEMESIS_KILLCAM_CAPS" ) )
				self.clipFinished( KillcamWidgetTitle0, {} )
				KillcamPerks:completeAnimation()
				self.KillcamPerks:setAlpha( 1 )
				self.clipFinished( KillcamPerks, {} )
				KillcamKilledBy:completeAnimation()
				self.KillcamKilledBy:setAlpha( 1 )
				self.clipFinished( KillcamKilledBy, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				local f9_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
				if f9_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
						f9_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					else
						f9_local0 = false
					end
				end
				return f9_local0
			end
		},
		{
			stateName = "FinalKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
			end
		},
		{
			stateName = "RoundEndingKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
			end
		},
		{
			stateName = "NemesisKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "Killcam" ) then
			PlayClipOnElement( self, {
				elementName = "Glitch",
				clipName = "GlitchSmall2Slow"
			}, controller )
		end
	end )
	KillcamPerks.id = "KillcamPerks"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.KillcamPerks:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.KillcamWidgetVignetteTop0:close()
		element.KillcamWidgetTitle0:close()
		element.Glitch:close()
		element.KillcamPerks:close()
		element.KillcamKilledBy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

