-- e65c1b780aeddd51dfd291f170b79d6a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 156 )
	self:setTopBottom( true, false, 0, 4 )
	
	local FactionCOlorBox = LUI.UIImage.new()
	FactionCOlorBox:setLeftRight( true, true, -0.5, 0.5 )
	FactionCOlorBox:setTopBottom( false, false, -2, 2 )
	FactionCOlorBox:setRGB( ColorSet.FactionAllies.r, ColorSet.FactionAllies.g, ColorSet.FactionAllies.b )
	FactionCOlorBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	FactionCOlorBox:setShaderVector( 0, 0.01, 0.01, 0.01, 0.01 )
	self:addElement( FactionCOlorBox )
	self.FactionCOlorBox = FactionCOlorBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FactionCOlorBox:completeAnimation()
				self.FactionCOlorBox:setAlpha( 0 )
				self.clipFinished( FactionCOlorBox, {} )
			end
		},
		FactionAxis = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FactionCOlorBox:completeAnimation()
				self.FactionCOlorBox:setRGB( ColorSet.FactionAxis.r, ColorSet.FactionAxis.g, ColorSet.FactionAxis.b )
				self.FactionCOlorBox:setAlpha( 1 )
				self.clipFinished( FactionCOlorBox, {} )
			end
		},
		FactionAllie = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FactionCOlorBox:completeAnimation()
				self.FactionCOlorBox:setRGB( ColorSet.FactionAllies.r, ColorSet.FactionAllies.g, ColorSet.FactionAllies.b )
				self.FactionCOlorBox:setAlpha( 1 )
				self.clipFinished( FactionCOlorBox, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

