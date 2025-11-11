require( "ui.uieditor.widgets.Lobby.Lists.Members.IconController" )

CoD.IconControllerContainer = InheritFrom( LUI.UIElement )
CoD.IconControllerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IconControllerContainer )
	self.id = "IconControllerContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 85 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local IconController = CoD.IconController.new( menu, controller )
	IconController:setLeftRight( 0, 0, 36, 86 )
	IconController:setTopBottom( 0, 0, 0, 48 )
	IconController:setAlpha( 0 )
	IconController:linkToElementModel( self, nil, false, function ( model )
		IconController:setModel( model, controller )
	end )
	self:addElement( IconController )
	self.IconController = IconController
	
	local VoipBacking = LUI.UIImage.new()
	VoipBacking:setLeftRight( 0, 0, 38, 86 )
	VoipBacking:setTopBottom( 0, 0, 0, 48 )
	VoipBacking:setAlpha( 0 )
	VoipBacking:setImage( RegisterImage( "uie_t7_menu_frontend_iconspeechback" ) )
	self:addElement( VoipBacking )
	self.VoipBacking = VoipBacking
	
	local VOIPImage = LUI.UIImage.new()
	VOIPImage:setLeftRight( 0, 0, 80, 48 )
	VOIPImage:setTopBottom( 0, 0, 7, 41 )
	VOIPImage:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VOIPImage:setupVoipImageByXUID( modelValue )
		end
	end )
	self:addElement( VOIPImage )
	self.VOIPImage = VOIPImage
	
	self.resetProperties = function ()
		IconController:completeAnimation()
		VoipBacking:completeAnimation()
		IconController:setLeftRight( 0, 0, 36, 86 )
		IconController:setTopBottom( 0, 0, 0, 48 )
		VoipBacking:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		VoipActive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				IconController:completeAnimation()
				self.IconController:setLeftRight( 0, 0, 0, 50 )
				self.IconController:setTopBottom( 0, 0, 0, 48 )
				self.clipFinished( IconController, {} )
				VoipBacking:completeAnimation()
				self.VoipBacking:setAlpha( 1 )
				self.clipFinished( VoipBacking, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.IconController:close()
		self.VOIPImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

