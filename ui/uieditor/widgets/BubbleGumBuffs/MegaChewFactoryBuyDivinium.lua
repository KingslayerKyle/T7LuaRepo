-- a59a1f6427b59e39c9ddd036c1ac55c9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.ChooseCharacter.ChooseCharacter_CardClickButton" )
require( "ui.uieditor.widgets.BubbleGumBuffs.MegaChewVialPercentOffLeft" )
require( "ui.uieditor.widgets.Lobby.Common.FE_HelpItemsLabel" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
	f1_arg0.clickButton.m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.MegaChewFactoryBuyDivinium = InheritFrom( LUI.UIElement )
CoD.MegaChewFactoryBuyDivinium.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MegaChewFactoryBuyDivinium )
	self.id = "MegaChewFactoryBuyDivinium"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 27 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, -29, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.6 )
	self:addElement( Background )
	self.Background = Background
	
	local Label0 = LUI.UIText.new()
	Label0:setLeftRight( true, false, 0, 337 )
	Label0:setTopBottom( false, false, -10, 10 )
	Label0:setText( Engine.Localize( "" ) )
	Label0:setTTF( "fonts/default.ttf" )
	Label0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Label0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 5 )
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -30, 1 )
	Image:setTopBottom( true, true, -1, 1 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.02, 0.14, 0, 0 )
	Image:setupNineSliceShader( 4, 4 )
	self:addElement( Image )
	self.Image = Image
	
	local Button1 = LUI.UIImage.new()
	Button1:setLeftRight( true, false, -25, -3 )
	Button1:setTopBottom( false, false, -11.2, 11.2 )
	Button1:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			Button1:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( Button1 )
	self.Button1 = Button1
	
	local MegaChewVialPercentOff0 = CoD.MegaChewVialPercentOffLeft.new( menu, controller )
	MegaChewVialPercentOff0:setLeftRight( true, false, -30, 470 )
	MegaChewVialPercentOff0:setTopBottom( true, false, 32, 54 )
	MegaChewVialPercentOff0.nameText:setText( Engine.Localize( "ZMUI_SPEICAL_PROMOTION_CAPS" ) )
	self:addElement( MegaChewVialPercentOff0 )
	self.MegaChewVialPercentOff0 = MegaChewVialPercentOff0
	
	local clickButton = CoD.ChooseCharacter_CardClickButton.new( menu, controller )
	clickButton:setLeftRight( true, false, -21, 150 )
	clickButton:setTopBottom( true, false, 1, 26 )
	clickButton:setAlpha( 0 )
	clickButton.label:setText( Engine.Localize( "" ) )
	clickButton.keyshortcut:setText( Engine.Localize( "" ) )
	self:addElement( clickButton )
	self.clickButton = clickButton
	
	local Breadcrumb = CoD.FE_HelpItemsLabel.new( menu, controller )
	Breadcrumb:setLeftRight( false, true, 7.5, 27.5 )
	Breadcrumb:setTopBottom( true, false, 3.7, 23.7 )
	Breadcrumb:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( Breadcrumb )
	self.Breadcrumb = Breadcrumb
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )

				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )

				Button1:completeAnimation()
				self.Button1:setAlpha( 0 )
				self.clipFinished( Button1, {} )

				clickButton:completeAnimation()
				self.clickButton:setAlpha( 0 )
				self.clipFinished( clickButton, {} )

				Breadcrumb:completeAnimation()
				self.Breadcrumb:setAlpha( 0 )
				self.clipFinished( Breadcrumb, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )

				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )

				Button1:completeAnimation()
				self.Button1:setAlpha( 0 )
				self.clipFinished( Button1, {} )

				Breadcrumb:completeAnimation()
				self.Breadcrumb:setAlpha( 0 )
				self.clipFinished( Breadcrumb, {} )
			end
		},
		VisiblePC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.6 )
				self.clipFinished( Background, {} )

				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )

				Button1:completeAnimation()
				self.Button1:setAlpha( 0 )
				self.clipFinished( Button1, {} )

				clickButton:completeAnimation()
				self.clickButton:setLeftRight( true, false, -21, 337 )
				self.clickButton:setTopBottom( true, false, 1, 26 )
				self.clickButton:setAlpha( 1 )
				self.clipFinished( clickButton, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.6 )
				self.clipFinished( Background, {} )

				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )

				Button1:completeAnimation()
				self.Button1:setAlpha( 1 )
				self.clipFinished( Button1, {} )

				clickButton:completeAnimation()
				self.clickButton:setAlpha( 0 )
				self.clipFinished( clickButton, {} )

				Breadcrumb:completeAnimation()
				self.Breadcrumb:setAlpha( 1 )
				self.clipFinished( Breadcrumb, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MegaChewVialPercentOff0:close()
		element.clickButton:close()
		element.Breadcrumb:close()
		element.Button1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
