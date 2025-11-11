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
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 28 )
	
	local ImgAllowDownload = LUI.UIImage.new()
	ImgAllowDownload:setLeftRight( 0, 0, 0, 30 )
	ImgAllowDownload:setTopBottom( 0, 0, 0, 28 )
	ImgAllowDownload:setRGB( 0.21, 0.21, 0.21 )
	self:addElement( ImgAllowDownload )
	self.ImgAllowDownload = ImgAllowDownload
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 3, 28 )
	Image0:setTopBottom( 0, 0, 3, 25 )
	Image0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.resetProperties = function ()
		Image0:completeAnimation()
		Image0:setRGB( 0.5, 0.5, 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		AllowDownload = {
			DefaultClip = function ()
				self.resetProperties()
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
		UpdateSelfState( self, controller )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

