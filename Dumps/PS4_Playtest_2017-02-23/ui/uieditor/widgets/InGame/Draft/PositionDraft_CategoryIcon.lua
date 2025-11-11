CoD.PositionDraft_CategoryIcon = InheritFrom( LUI.UIElement )
CoD.PositionDraft_CategoryIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PositionDraft_CategoryIcon )
	self.id = "PositionDraft_CategoryIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 495 )
	self:setTopBottom( 0, 0, 0, 47 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 224, 271 )
	Icon:setTopBottom( 0, 0, 8, 55 )
	Icon:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local line = LUI.UIImage.new()
	line:setLeftRight( 0, 0, 143, 215 )
	line:setTopBottom( 0, 0, 6, 30 )
	line:setAlpha( 0 )
	line:setImage( RegisterImage( "uie_menu_loadout_accent" ) )
	self:addElement( line )
	self.line = line
	
	local line2 = LUI.UIImage.new()
	line2:setLeftRight( 0, 0, 281, 353 )
	line2:setTopBottom( 0, 0, 6, 30 )
	line2:setAlpha( 0 )
	line2:setYRot( 180 )
	line2:setImage( RegisterImage( "uie_menu_loadout_accent" ) )
	self:addElement( line2 )
	self.line2 = line2
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( 0, 0, 68, 428 )
	frame:setTopBottom( 0, 0, -203, 37 )
	frame:setAlpha( 0.4 )
	frame:setImage( RegisterImage( "uie_menu_loadout_frame_group" ) )
	self:addElement( frame )
	self.frame = frame
	
	self.resetProperties = function ()
		Icon:completeAnimation()
		Icon:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 0.33, 0.95, 0.71 )
				self.clipFinished( Icon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Icon:completeAnimation()
				self.Icon:setRGB( 1, 0.66, 0 )
				self.clipFinished( Icon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Icon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

