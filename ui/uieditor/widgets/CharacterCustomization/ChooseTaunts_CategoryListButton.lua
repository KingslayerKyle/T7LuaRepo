-- 85f1b024d87ac8175278a9f0483dc9b2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_CategoryListButtonText" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.ChooseTaunts_CategoryListButton = InheritFrom( LUI.UIElement )
CoD.ChooseTaunts_CategoryListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunts_CategoryListButton )
	self.id = "ChooseTaunts_CategoryListButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 507 )
	self:setTopBottom( true, false, 0, 55 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, -307 )
	StartMenuframenoBG0:setTopBottom( true, true, 3, -3 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( true, true, 202.5, -97.03 )
	StartMenuframenoBG1:setTopBottom( true, true, 3, -3 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Title = CoD.ChooseTaunts_CategoryListButtonText.new( menu, controller )
	Title:setLeftRight( true, false, 9, 197 )
	Title:setTopBottom( true, false, 16.5, 38.5 )
	Title:linkToElementModel( self, nil, false, function ( model )
		Title:setModel( model, controller )
	end )
	Title:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return AreAnyTauntsGesturesInListNew( self, element, controller )
			end
		}
	} )
	self:addElement( Title )
	self.Title = Title
	
	local selectedTaunt = LUI.UIText.new()
	selectedTaunt:setLeftRight( true, true, 210.5, -105.5 )
	selectedTaunt:setTopBottom( false, false, -11, 11 )
	selectedTaunt:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	selectedTaunt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedTaunt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	selectedTaunt:linkToElementModel( self, "selectedItem", true, function ( model )
		local selectedItem = Engine.GetModelValue( model )
		if selectedItem then
			selectedTaunt:setText( Engine.Localize( selectedItem ) )
		end
	end )
	self:addElement( selectedTaunt )
	self.selectedTaunt = selectedTaunt
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( true, true, 202.5, -97.03 )
	FocusBarB0:setTopBottom( false, true, -7, -3 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarT0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT0:setLeftRight( true, true, 202.5, -97.03 )
	FocusBarT0:setTopBottom( true, false, 3, 7 )
	FocusBarT0:setAlpha( 0 )
	FocusBarT0:setZoom( 1 )
	self:addElement( FocusBarT0 )
	self.FocusBarT0 = FocusBarT0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 0 )
				self.clipFinished( FocusBarT0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 1 )
				self.clipFinished( FocusBarT0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG1:close()
		element.Title:close()
		element.FocusBarB0:close()
		element.FocusBarT0:close()
		element.selectedTaunt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

