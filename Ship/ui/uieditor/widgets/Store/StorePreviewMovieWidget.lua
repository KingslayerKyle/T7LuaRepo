-- b5a2445eb8b3e67c0a5439545957530a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.buttonprompt" )

local PreLoadFunc = function ( self, controller )
	self.StopStoreMoviePreviewPlayback = function ( f2_arg0, f2_arg1 )
		f2_arg0.storeMovie:setupMoviePlayback( "" )
	end
	
	self.StopStoreMoviePreviewAndClose = function ()
		self.storeMovie:setupMoviePlayback( "" )
		self:close()
	end
	
end

CoD.StorePreviewMovieWidget = InheritFrom( LUI.UIElement )
CoD.StorePreviewMovieWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StorePreviewMovieWidget )
	self.id = "StorePreviewMovieWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 386 )
	self:setTopBottom( true, false, 0, 254 )
	self.anyChildUsesUpdateState = true
	
	local blackBg = LUI.UIImage.new()
	blackBg:setLeftRight( true, true, 0, 0 )
	blackBg:setTopBottom( true, true, 0, 0 )
	blackBg:setRGB( 0, 0, 0 )
	self:addElement( blackBg )
	self.blackBg = blackBg
	
	local storeMovie = LUI.UIImage.new()
	storeMovie:setLeftRight( true, false, 0, 386 )
	storeMovie:setTopBottom( false, false, -96.5, 116.5 )
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
	self:addElement( buttonPrompt )
	self.buttonPrompt = buttonPrompt
	
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		CallCustomElementFunction_Self( self, "StopStoreMoviePreviewPlayback", controller )
	end )
	self:subscribeToGlobalModel( controller, "PerController", "StoreRoot.isNonFeatureProductListInFocus", function ( model )
		local f7_local0 = self
		if IsModelValueEqualTo( controller, "StoreRoot.isNonFeatureProductListInFocus", 0 ) then
			CallCustomElementFunction_Self( self, "StopStoreMoviePreviewAndClose", controller )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttonPrompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
