-- 5a5272df88455475a97cb6963b442054
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyHintTextWidget" )
require( "ui.uieditor.widgets.CAC.cac_FocusBarContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "gobble_gum_recipe_distill_tick", function ( element, event )
		local f2_local0 = Engine.GetModel( self:getModel(), "timeRemaining" )
		local f2_local1 = Engine.GetModel( self:getModel(), "distillID" )
		if f2_local1 and f2_local0 then
			local f2_local2 = CoD.BubbleGumBuffUtility.GetDistillCooldown( controller, Engine.GetModelValue( f2_local1 ) )
			if f2_local2 >= 0 then
				Engine.SetModelValue( f2_local0, f2_local2 )
			end
			if self.currentState == "ShowTimer" then
				Engine.SetModelValue( Engine.GetModel( self:getModel(), "hintText" ), Engine.Localize( "ZMUI_COOKBOOK_FREE_HINT_TIMER", SecondsAsHourMinutesSeconds( f2_local2 ) ) )
			end
			if f2_local2 == 0 and Engine.GetModelValue( Engine.GetModel( self:getModel(), "disabled" ) ) == true and CanGetFreeGobblegumCookbookUses( controller ) then
				Engine.SetModelValue( Engine.GetModel( self:getModel(), "disabled" ), false )
			end
		end
	end )
end

CoD.GobbleGumCookbook_FreeDistillsListItem = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbook_FreeDistillsListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbook_FreeDistillsListItem )
	self.id = "GobbleGumCookbook_FreeDistillsListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 190 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2.77 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, -2, 2 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local FEFocusBarContainerTop = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerTop:setLeftRight( true, true, -2, 2 )
	FEFocusBarContainerTop:setTopBottom( true, false, -4, 4 )
	self:addElement( FEFocusBarContainerTop )
	self.FEFocusBarContainerTop = FEFocusBarContainerTop
	
	local FEFocusBarContainerBottom = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarContainerBottom:setLeftRight( true, true, -2, 2 )
	FEFocusBarContainerBottom:setTopBottom( false, true, -3, 5 )
	self:addElement( FEFocusBarContainerBottom )
	self.FEFocusBarContainerBottom = FEFocusBarContainerBottom
	
	local HowManyGiven = LUI.UITightText.new()
	HowManyGiven:setLeftRight( true, false, 7, 95.39 )
	HowManyGiven:setTopBottom( false, true, -45, 0 )
	HowManyGiven:setRGB( 1, 0.77, 0 )
	HowManyGiven:setAlpha( 0.85 )
	HowManyGiven:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	HowManyGiven:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			HowManyGiven:setText( LocalizeIntoString( "MENU_MULTIPLIER_X", text ) )
		end
	end )
	self:addElement( HowManyGiven )
	self.HowManyGiven = HowManyGiven
	
	local FreeTextBox = LUI.UIText.new()
	FreeTextBox:setLeftRight( true, false, 4, 186 )
	FreeTextBox:setTopBottom( true, false, 6.5, 31.5 )
	FreeTextBox:setText( Engine.Localize( "MENU_STORE_FREE_PRODUCT" ) )
	FreeTextBox:setTTF( "fonts/default.ttf" )
	FreeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FreeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FreeTextBox )
	self.FreeTextBox = FreeTextBox
	
	local CryptokeyHintTextWidget = CoD.CryptokeyHintTextWidget.new( menu, controller )
	CryptokeyHintTextWidget:setLeftRight( true, false, -20, 210 )
	CryptokeyHintTextWidget:setTopBottom( true, false, 192, 239 )
	CryptokeyHintTextWidget:setAlpha( 0 )
	CryptokeyHintTextWidget:linkToElementModel( self, nil, false, function ( model )
		CryptokeyHintTextWidget:setModel( model, controller )
	end )
	self:addElement( CryptokeyHintTextWidget )
	self.CryptokeyHintTextWidget = CryptokeyHintTextWidget
	
	local Timer = LUI.UIText.new()
	Timer:setLeftRight( true, false, 0, 190 )
	Timer:setTopBottom( true, false, 82.5, 107.5 )
	Timer:setTTF( "fonts/default.ttf" )
	Timer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Timer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Timer:linkToElementModel( self, "timeRemaining", true, function ( model )
		local timeRemaining = Engine.GetModelValue( model )
		if timeRemaining then
			Timer:setText( Engine.Localize( SecondsAsHourMinutesSeconds( timeRemaining ) ) )
		end
	end )
	Timer:registerEventHandler( "menu_opened", function ( element, event )
		local f7_local0 = nil
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( false, false, -73.86, 73.86 )
	icon:setTopBottom( true, false, 24.97, 172.69 )
	icon:setImage( RegisterImage( "uie_t7_zm_cookbook_distill_icon" ) )
	self:addElement( icon )
	self.icon = icon
	
	local cacFocusBarContainerTop = CoD.cac_FocusBarContainer.new( menu, controller )
	cacFocusBarContainerTop:setLeftRight( true, true, -2, 2 )
	cacFocusBarContainerTop:setTopBottom( true, false, -4, 4 )
	self:addElement( cacFocusBarContainerTop )
	self.cacFocusBarContainerTop = cacFocusBarContainerTop
	
	local cacFocusBarContainerBottom = CoD.cac_FocusBarContainer.new( menu, controller )
	cacFocusBarContainerBottom:setLeftRight( true, true, -2, 2 )
	cacFocusBarContainerBottom:setTopBottom( false, true, -3, 5 )
	self:addElement( cacFocusBarContainerBottom )
	self.cacFocusBarContainerBottom = cacFocusBarContainerBottom
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )

				HowManyGiven:completeAnimation()
				self.HowManyGiven:setAlpha( 0.85 )
				self.clipFinished( HowManyGiven, {} )

				FreeTextBox:completeAnimation()
				self.FreeTextBox:setAlpha( 1 )
				self.clipFinished( FreeTextBox, {} )

				CryptokeyHintTextWidget:completeAnimation()
				self.CryptokeyHintTextWidget:setAlpha( 0 )
				self.clipFinished( CryptokeyHintTextWidget, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )

				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )

				cacFocusBarContainerTop:completeAnimation()
				self.cacFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerTop, {} )

				cacFocusBarContainerBottom:completeAnimation()
				self.cacFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerBottom, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( FEFocusBarContainerBottom, {} )

				HowManyGiven:completeAnimation()
				self.HowManyGiven:setAlpha( 0.85 )
				self.clipFinished( HowManyGiven, {} )

				FreeTextBox:completeAnimation()
				self.FreeTextBox:setAlpha( 1 )
				self.clipFinished( FreeTextBox, {} )

				CryptokeyHintTextWidget:completeAnimation()
				self.CryptokeyHintTextWidget:setAlpha( 0 )
				self.clipFinished( CryptokeyHintTextWidget, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )

				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )

				cacFocusBarContainerTop:completeAnimation()
				self.cacFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerTop, {} )

				cacFocusBarContainerBottom:completeAnimation()
				self.cacFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerBottom, {} )
			end
		},
		ShowTimer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )

				HowManyGiven:completeAnimation()
				self.HowManyGiven:setAlpha( 0 )
				self.clipFinished( HowManyGiven, {} )

				FreeTextBox:completeAnimation()
				self.FreeTextBox:setAlpha( 0.5 )
				self.clipFinished( FreeTextBox, {} )

				CryptokeyHintTextWidget:completeAnimation()
				self.CryptokeyHintTextWidget:setAlpha( 0 )
				self.clipFinished( CryptokeyHintTextWidget, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0.5 )
				self.clipFinished( Timer, {} )

				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )

				cacFocusBarContainerTop:completeAnimation()
				self.cacFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerTop, {} )

				cacFocusBarContainerBottom:completeAnimation()
				self.cacFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerBottom, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )

				HowManyGiven:completeAnimation()
				self.HowManyGiven:setAlpha( 0 )
				self.clipFinished( HowManyGiven, {} )

				FreeTextBox:completeAnimation()
				self.FreeTextBox:setAlpha( 0.5 )
				self.clipFinished( FreeTextBox, {} )

				CryptokeyHintTextWidget:completeAnimation()
				self.CryptokeyHintTextWidget:setAlpha( 1 )
				self.clipFinished( CryptokeyHintTextWidget, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0.5 )
				self.clipFinished( Timer, {} )

				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				self.clipFinished( icon, {} )

				cacFocusBarContainerTop:completeAnimation()
				self.cacFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( cacFocusBarContainerTop, {} )

				cacFocusBarContainerBottom:completeAnimation()
				self.cacFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( cacFocusBarContainerBottom, {} )
			end
		},
		HaveFreeDistills = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )

				HowManyGiven:completeAnimation()
				self.HowManyGiven:setAlpha( 0 )
				self.clipFinished( HowManyGiven, {} )

				FreeTextBox:completeAnimation()
				self.FreeTextBox:setAlpha( 0.5 )
				self.clipFinished( FreeTextBox, {} )

				CryptokeyHintTextWidget:completeAnimation()
				self.CryptokeyHintTextWidget:setAlpha( 0 )
				self.clipFinished( CryptokeyHintTextWidget, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )

				icon:completeAnimation()
				self.icon:setAlpha( 0.5 )
				self.clipFinished( icon, {} )

				cacFocusBarContainerTop:completeAnimation()
				self.cacFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerTop, {} )

				cacFocusBarContainerBottom:completeAnimation()
				self.cacFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( cacFocusBarContainerBottom, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEFocusBarContainerTop:completeAnimation()
				self.FEFocusBarContainerTop:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerTop, {} )

				FEFocusBarContainerBottom:completeAnimation()
				self.FEFocusBarContainerBottom:setAlpha( 0 )
				self.clipFinished( FEFocusBarContainerBottom, {} )

				HowManyGiven:completeAnimation()
				self.HowManyGiven:setAlpha( 0 )
				self.clipFinished( HowManyGiven, {} )

				FreeTextBox:completeAnimation()
				self.FreeTextBox:setAlpha( 0.5 )
				self.clipFinished( FreeTextBox, {} )

				CryptokeyHintTextWidget:completeAnimation()
				self.CryptokeyHintTextWidget:setAlpha( 1 )
				self.clipFinished( CryptokeyHintTextWidget, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )

				icon:completeAnimation()
				self.icon:setAlpha( 0.5 )
				self.clipFinished( icon, {} )

				cacFocusBarContainerTop:completeAnimation()
				self.cacFocusBarContainerTop:setAlpha( 1 )
				self.clipFinished( cacFocusBarContainerTop, {} )

				cacFocusBarContainerBottom:completeAnimation()
				self.cacFocusBarContainerBottom:setAlpha( 1 )
				self.clipFinished( cacFocusBarContainerBottom, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ShowTimer",
			condition = function ( menu, element, event )
				return ShowGobbleGumDistillTimer( self, controller )
			end
		},
		{
			stateName = "HaveFreeDistills",
			condition = function ( menu, element, event )
				return not CanGetFreeGobblegumCookbookUses( controller )
			end
		}
	} )
	self:linkToElementModel( self, "timeRemaining", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "timeRemaining"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "GobbleGumDistills.freeDistills" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GobbleGumDistills.freeDistills"
		} )
	end )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsSelfInState( self, "HaveFreeDistills" ) then
			SetSelfModelValue( self, element, controller, "hintText", Engine.Localize( "ZMUI_COOKBOOK_FREE_HINT_HAVE_DISTILLS", math.floor( CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill( controller, CoD.BubbleGumBuffUtility.FREE_DISTILL ) / CoD.BubbleGumBuffUtility.GetRecipeDistillCost() ) ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.FEFocusBarContainerTop:close()
		element.FEFocusBarContainerBottom:close()
		element.CryptokeyHintTextWidget:close()
		element.cacFocusBarContainerTop:close()
		element.cacFocusBarContainerBottom:close()
		element.HowManyGiven:close()
		element.Timer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

