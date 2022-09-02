-- b15542ddbeb974744830159468dc1eda
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.buttonprompt" )

local PreLoadFunc = function ( self, controller )
	self.StopStoreMoviePreviewPlayback = function ( f2_arg0, f2_arg1 )
		self.storeMovie:setupMoviePlayback( "" )
	end
	
end

CoD.StoreVideoProductButtonMovieWidget = InheritFrom( LUI.UIElement )
CoD.StoreVideoProductButtonMovieWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StoreVideoProductButtonMovieWidget )
	self.id = "StoreVideoProductButtonMovieWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 267 )
	self:setTopBottom( true, false, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 267 )
	background:setTopBottom( true, false, 0, 150 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local storeMovie = LUI.UIImage.new()
	storeMovie:setLeftRight( true, false, 0, 267 )
	storeMovie:setTopBottom( true, false, 0, 150 )
	storeMovie:setupMoviePlayback( "" )
	self:addElement( storeMovie )
	self.storeMovie = storeMovie
	
	local buttonPrompt = CoD.buttonprompt.new( menu, controller )
	buttonPrompt:setLeftRight( true, false, 0, 214 )
	buttonPrompt:setTopBottom( true, false, 0, 31 )
	buttonPrompt.label:setText( Engine.Localize( "MENU_VIEW_FULL_SCREEN" ) )
	buttonPrompt:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			buttonPrompt.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	buttonPrompt:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( buttonPrompt )
	self.buttonPrompt = buttonPrompt
	
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CallCustomElementFunction_Self( self, "StopStoreMoviePreviewPlayback", "" )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonPrompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

