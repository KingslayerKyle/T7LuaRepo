require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.FileshareCustomGamesLocalGameTypeImage = InheritFrom( LUI.UIElement )
CoD.FileshareCustomGamesLocalGameTypeImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareCustomGamesLocalGameTypeImage )
	self.id = "FileshareCustomGamesLocalGameTypeImage"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 450 )
	
	local LocalGameTypeImage = LUI.UIImage.new()
	LocalGameTypeImage:setLeftRight( 0, 1, 150, -150 )
	LocalGameTypeImage:setTopBottom( 0, 1, 0, 0 )
	self:addElement( LocalGameTypeImage )
	self.LocalGameTypeImage = LocalGameTypeImage
	
	local BorderBakedBlur = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur:setLeftRight( 0, 1, 0, 0 )
	BorderBakedBlur:setTopBottom( 0, 1, 0, 0 )
	BorderBakedBlur:setAlpha( 0.4 )
	self:addElement( BorderBakedBlur )
	self.BorderBakedBlur = BorderBakedBlur
	
	local BorderBakedSolid = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid:setLeftRight( 0, 1, 0, 0 )
	BorderBakedSolid:setTopBottom( 0, 1, 0, 0 )
	BorderBakedSolid:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid )
	self.BorderBakedSolid = BorderBakedSolid
	
	self.resetProperties = function ()
		BorderBakedSolid:completeAnimation()
		BorderBakedBlur:completeAnimation()
		LocalGameTypeImage:completeAnimation()
		BorderBakedSolid:setAlpha( 0.5 )
		BorderBakedBlur:setAlpha( 0.4 )
		LocalGameTypeImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LocalGameTypeImage:completeAnimation()
				self.LocalGameTypeImage:setAlpha( 0 )
				self.clipFinished( LocalGameTypeImage, {} )
				BorderBakedBlur:completeAnimation()
				self.BorderBakedBlur:setAlpha( 0 )
				self.clipFinished( BorderBakedBlur, {} )
				BorderBakedSolid:completeAnimation()
				self.BorderBakedSolid:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedBlur:close()
		self.BorderBakedSolid:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

