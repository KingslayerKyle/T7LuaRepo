CoD.FileshareSelectorItemLarge_Image = InheritFrom( LUI.UIElement )
CoD.FileshareSelectorItemLarge_Image.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FileshareSelectorItemLarge_Image )
	self.id = "FileshareSelectorItemLarge_Image"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 151 )
	
	local WCFileshareIconExtraCamRender0 = LUI.UIImage.new()
	WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 244 )
	WCFileshareIconExtraCamRender0:setTopBottom( false, false, -75.5, 61.5 )
	self:addElement( WCFileshareIconExtraCamRender0 )
	self.WCFileshareIconExtraCamRender0 = WCFileshareIconExtraCamRender0
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( true, true, 0, 0 )
	MapImage:setTopBottom( false, false, -75.5, 50.5 )
	MapImage:setAlpha( 0 )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Thumbnail = LUI.UIElement.new()
	Thumbnail:setLeftRight( true, true, 0, 0 )
	Thumbnail:setTopBottom( false, false, -75.5, 75.5 )
	self:addElement( Thumbnail )
	self.Thumbnail = Thumbnail
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 243 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( false, false, -104, 104 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setLeftRight( true, true, 0, 0 )
				self.MapImage:setTopBottom( false, false, -117.5, 92.5 )
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setLeftRight( true, true, 0, 0 )
				self.Thumbnail:setTopBottom( false, false, -117.5, 117.5 )
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		InvalidNormal = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 243 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( false, false, -104, 104 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setLeftRight( true, true, 0, 0 )
				self.MapImage:setTopBottom( false, false, -117.5, 92.5 )
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setLeftRight( true, true, 0, 0 )
				self.Thumbnail:setTopBottom( false, false, -117.5, 117.5 )
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		InvalidShort = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 245 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( false, false, -75.5, 75.5 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setLeftRight( true, true, 0, 0 )
				self.MapImage:setTopBottom( false, false, -75.5, 50.5 )
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setLeftRight( true, true, 0, 0 )
				self.Thumbnail:setTopBottom( false, false, -75.5, 75.5 )
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 245 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( false, false, -75.5, 75.5 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setLeftRight( true, true, 0, 0 )
				self.MapImage:setTopBottom( false, false, -75.5, 50.5 )
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setLeftRight( true, true, 0, 0 )
				self.Thumbnail:setTopBottom( false, false, -75.5, 75.5 )
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		Film = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 245 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( false, false, -75.5, 75.5 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setLeftRight( true, true, 0, 0 )
				self.MapImage:setTopBottom( false, false, -75.5, 50.5 )
				self.MapImage:setAlpha( 1 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setLeftRight( true, true, 0, 0 )
				self.Thumbnail:setTopBottom( false, false, -75.5, 75.5 )
				self.Thumbnail:setAlpha( 0 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		Clip = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 245 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( false, false, -75.5, 75.5 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setLeftRight( true, true, 0, 0 )
				self.MapImage:setTopBottom( false, false, -75.5, 50.5 )
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setLeftRight( true, true, 0, 0 )
				self.Thumbnail:setTopBottom( false, false, -75.5, 75.5 )
				self.Thumbnail:setAlpha( 1 )
				self.clipFinished( Thumbnail, {} )
			end
		},
		Screenshot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender0:completeAnimation()
				self.WCFileshareIconExtraCamRender0:setLeftRight( true, false, 0, 245 )
				self.WCFileshareIconExtraCamRender0:setTopBottom( false, false, -75.5, 75.5 )
				self.clipFinished( WCFileshareIconExtraCamRender0, {} )
				MapImage:completeAnimation()
				self.MapImage:setLeftRight( true, true, 0, 0 )
				self.MapImage:setTopBottom( false, false, -75.5, 50.5 )
				self.MapImage:setAlpha( 0 )
				self.clipFinished( MapImage, {} )
				Thumbnail:completeAnimation()
				self.Thumbnail:setLeftRight( true, true, 0, 0 )
				self.Thumbnail:setTopBottom( false, false, -75.5, 75.5 )
				self.Thumbnail:setAlpha( 1 )
				self.clipFinished( Thumbnail, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InvalidNormal",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isValid" )
			end
		},
		{
			stateName = "InvalidShort",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isValid" )
			end
		},
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsFileshareCategoryFilm( self, element, controller ) and not IsFileshareCategoryClip( self, element, controller ) then
					f11_local0 = not IsFileshareCategoryScreenshot( self, element, controller )
				else
					f11_local0 = false
				end
				return f11_local0
			end
		},
		{
			stateName = "Film",
			condition = function ( menu, element, event )
				return IsFileshareCategoryFilm( self, element, controller )
			end
		},
		{
			stateName = "Clip",
			condition = function ( menu, element, event )
				return IsFileshareCategoryClip( self, element, controller )
			end
		},
		{
			stateName = "Screenshot",
			condition = function ( menu, element, event )
				return IsFileshareCategoryScreenshot( self, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "isValid", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isValid"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

