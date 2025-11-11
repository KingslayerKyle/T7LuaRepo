CoD.LoadingScreenTeamBoxFactionColor = InheritFrom( LUI.UIElement )
CoD.LoadingScreenTeamBoxFactionColor.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenTeamBoxFactionColor )
	self.id = "LoadingScreenTeamBoxFactionColor"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 234 )
	self:setTopBottom( 0, 0, 0, 6 )
	
	local FactionCOlorBox = LUI.UIImage.new()
	FactionCOlorBox:setLeftRight( 0, 1, -1, 1 )
	FactionCOlorBox:setTopBottom( 0.5, 0.5, -3, 3 )
	FactionCOlorBox:setRGB( ColorSet.FactionAllies.r, ColorSet.FactionAllies.g, ColorSet.FactionAllies.b )
	FactionCOlorBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	FactionCOlorBox:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( FactionCOlorBox )
	self.FactionCOlorBox = FactionCOlorBox
	
	self.resetProperties = function ()
		FactionCOlorBox:completeAnimation()
		FactionCOlorBox:setRGB( ColorSet.FactionAllies.r, ColorSet.FactionAllies.g, ColorSet.FactionAllies.b )
		FactionCOlorBox:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FactionCOlorBox:completeAnimation()
				self.FactionCOlorBox:setAlpha( 0 )
				self.clipFinished( FactionCOlorBox, {} )
			end
		},
		FactionAxis = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FactionCOlorBox:completeAnimation()
				self.FactionCOlorBox:setRGB( ColorSet.FactionAxis.r, ColorSet.FactionAxis.g, ColorSet.FactionAxis.b )
				self.clipFinished( FactionCOlorBox, {} )
			end
		},
		FactionAllie = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

