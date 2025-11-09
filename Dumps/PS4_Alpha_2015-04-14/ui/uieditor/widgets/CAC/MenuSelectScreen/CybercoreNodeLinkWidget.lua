CoD.CybercoreNodeLinkWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreNodeLinkWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreNodeLinkWidget )
	self.id = "CybercoreNodeLinkWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	
	local linkImage = LUI.UIImage.new()
	linkImage:setLeftRight( true, true, 0, 0 )
	linkImage:setTopBottom( true, true, 0, 0 )
	linkImage:setRGB( 0.39, 0.39, 0.39 )
	linkImage:setAlpha( 0.25 )
	linkImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( linkImage )
	self.linkImage = linkImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				linkImage:completeAnimation()
				self.linkImage:setAlpha( 0.05 )
				self.clipFinished( linkImage, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				linkImage:completeAnimation()
				self.linkImage:setRGB( 1, 0, 0 )
				self.linkImage:setAlpha( 0.5 )
				self.clipFinished( linkImage, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				linkImage:completeAnimation()
				self.linkImage:setRGB( 0, 1, 0 )
				self.linkImage:setAlpha( 0.5 )
				self.clipFinished( linkImage, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

