require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_CategoryListButtonText" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( 0, 0, 0, 760 )
	self:setTopBottom( 0, 0, 0, 82 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, -460 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 4, -4 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( 0, 1, 304, -146 )
	StartMenuframenoBG1:setTopBottom( 0, 1, 4, -4 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Title = CoD.ChooseTaunts_CategoryListButtonText.new( menu, controller )
	Title:mergeStateConditions( {
		{
			stateName = "BreadcrumbVisible",
			condition = function ( menu, element, event )
				return AreAnyTauntsGesturesInListNew( self, element, controller )
			end
		}
	} )
	Title:setLeftRight( 0, 0, 13, 295 )
	Title:setTopBottom( 0, 0, 24.5, 57.5 )
	Title:linkToElementModel( self, nil, false, function ( model )
		Title:setModel( model, controller )
	end )
	self:addElement( Title )
	self.Title = Title
	
	local selectedTaunt = LUI.UIText.new()
	selectedTaunt:setLeftRight( 0, 1, 316, -158 )
	selectedTaunt:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	selectedTaunt:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	selectedTaunt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	selectedTaunt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	selectedTaunt:linkToElementModel( self, "selectedItem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectedTaunt:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( selectedTaunt )
	self.selectedTaunt = selectedTaunt
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( 0, 1, 304, -146 )
	FocusBarB0:setTopBottom( 1, 1, -11, -5 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarT0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT0:setLeftRight( 0, 1, 304, -146 )
	FocusBarT0:setTopBottom( 0, 0, 5, 11 )
	FocusBarT0:setAlpha( 0 )
	FocusBarT0:setZoom( 1 )
	self:addElement( FocusBarT0 )
	self.FocusBarT0 = FocusBarT0
	
	self.resetProperties = function ()
		FocusBarT0:completeAnimation()
		FocusBarB0:completeAnimation()
		FocusBarT0:setAlpha( 0 )
		FocusBarB0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG1:close()
		self.Title:close()
		self.FocusBarB0:close()
		self.FocusBarT0:close()
		self.selectedTaunt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

