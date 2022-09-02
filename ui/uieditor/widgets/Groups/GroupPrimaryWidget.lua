-- 355633fa029e7210f2c38e58f29ee725
-- This hash is used for caching, delete to decompile the file again

CoD.GroupPrimaryWidget = InheritFrom( LUI.UIElement )
CoD.GroupPrimaryWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupPrimaryWidget )
	self.id = "GroupPrimaryWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 341 )
	self:setTopBottom( true, false, 0, 42 )
	
	local PrimaryIcon = LUI.UIImage.new()
	PrimaryIcon:setLeftRight( true, false, 0, 42 )
	PrimaryIcon:setTopBottom( true, false, 0, 42 )
	PrimaryIcon:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	PrimaryIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_groups_favorites" ) )
	self:addElement( PrimaryIcon )
	self.PrimaryIcon = PrimaryIcon
	
	local PrimaryLabel = LUI.UITightText.new()
	PrimaryLabel:setLeftRight( true, false, 41, 341 )
	PrimaryLabel:setTopBottom( true, false, 3, 25 )
	PrimaryLabel:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	PrimaryLabel:setText( Engine.Localize( "GROUPS_PRIMARY_GROUP" ) )
	PrimaryLabel:setTTF( "fonts/escom.ttf" )
	PrimaryLabel:setLetterSpacing( -0.5 )
	self:addElement( PrimaryLabel )
	self.PrimaryLabel = PrimaryLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PrimaryIcon:completeAnimation()
				self.PrimaryIcon:setAlpha( 0 )
				self.clipFinished( PrimaryIcon, {} )

				PrimaryLabel:completeAnimation()
				self.PrimaryLabel:setAlpha( 0 )
				self.clipFinished( PrimaryLabel, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				PrimaryIcon:completeAnimation()
				self.PrimaryIcon:setAlpha( 1 )
				self.clipFinished( PrimaryIcon, {} )

				PrimaryLabel:completeAnimation()
				self.PrimaryLabel:setAlpha( 1 )
				self.clipFinished( PrimaryLabel, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

