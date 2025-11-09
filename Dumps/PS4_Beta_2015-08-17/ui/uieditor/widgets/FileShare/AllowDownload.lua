CoD.AllowDownload = InheritFrom( LUI.UIElement )
CoD.AllowDownload.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AllowDownload )
	self.id = "AllowDownload"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 20 )
	self:setTopBottom( true, false, 0, 19 )
	
	local ImgAllowDownload = LUI.UIImage.new()
	ImgAllowDownload:setLeftRight( true, false, 0, 20 )
	ImgAllowDownload:setTopBottom( true, false, 0, 19 )
	ImgAllowDownload:setRGB( 0.21, 0.21, 0.21 )
	self:addElement( ImgAllowDownload )
	self.ImgAllowDownload = ImgAllowDownload
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 1.63, 18.63 )
	Image0:setTopBottom( true, false, 2, 17 )
	Image0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( Image0, {} )
			end
		},
		AllowDownload = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Image0:completeAnimation()
				self.Image0:setRGB( 0.02, 1, 0 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AllowDownload",
			condition = function ( menu, element, event )
				return FileshareShouldAllowDownload()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.publishAllowDownload" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.publishAllowDownload"
		} )
	end )
	self:subscribeToGlobalModel( controller, "FileshareRoot", "publishAllowDownload", function ( model )
		local element = self
		UpdateState( self, event )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

