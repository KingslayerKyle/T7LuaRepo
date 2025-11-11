require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreen_DoubleXPLabel" )

CoD.DoubleLoot_small = InheritFrom( LUI.UIElement )
CoD.DoubleLoot_small.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DoubleLoot_small )
	self.id = "DoubleLoot_small"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 90 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local LoadingScreenDoubleXPLabel = CoD.LoadingScreen_DoubleXPLabel.new( menu, controller )
	LoadingScreenDoubleXPLabel:setLeftRight( 1, 1, -363, -57 )
	LoadingScreenDoubleXPLabel:setTopBottom( 0, 0, 26, 62 )
	LoadingScreenDoubleXPLabel:setAlpha( 0 )
	LoadingScreenDoubleXPLabel:setScale( 0.9 )
	LoadingScreenDoubleXPLabel.FETitleNumBrdr0:setAlpha( 0.7 )
	LoadingScreenDoubleXPLabel.XPLabel:setRGB( 1, 0.88, 0.43 )
	LoadingScreenDoubleXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLELOOT" ) )
	self:addElement( LoadingScreenDoubleXPLabel )
	self.LoadingScreenDoubleXPLabel = LoadingScreenDoubleXPLabel
	
	local cryptokeyBack = LUI.UIImage.new()
	cryptokeyBack:setLeftRight( 1, 1, -78, 12 )
	cryptokeyBack:setTopBottom( 0, 0, 0, 90 )
	cryptokeyBack:setScale( 0.75 )
	cryptokeyBack:setImage( RegisterImage( "uie_t7_icon_blackmarket_doubleloot_small" ) )
	self:addElement( cryptokeyBack )
	self.cryptokeyBack = cryptokeyBack
	
	self.resetProperties = function ()
		cryptokeyBack:completeAnimation()
		cryptokeyBack:setAlpha( 1 )
		cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 0 )
				self.clipFinished( cryptokeyBack, {} )
			end
		},
		DoubleLoot = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local cryptokeyBackFrame2 = function ( cryptokeyBack, event )
					local cryptokeyBackFrame3 = function ( cryptokeyBack, event )
						local cryptokeyBackFrame4 = function ( cryptokeyBack, event )
							if not event.interrupted then
								cryptokeyBack:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
							end
							cryptokeyBack:setAlpha( 1 )
							cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint" ) )
							cryptokeyBack:setShaderVector( 0, 0.99, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( cryptokeyBack, event )
							else
								cryptokeyBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							cryptokeyBackFrame4( cryptokeyBack, event )
							return 
						else
							cryptokeyBack:beginAnimation( "keyframe", 570, false, false, CoD.TweenType.Linear )
							cryptokeyBack:setShaderVector( 0, 0.99, 0, 0, 0 )
							cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyBackFrame3( cryptokeyBack, event )
						return 
					else
						cryptokeyBack:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						cryptokeyBack:registerEventHandler( "transition_complete_keyframe", cryptokeyBackFrame3 )
					end
				end
				
				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 1 )
				self.cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint" ) )
				self.cryptokeyBack:setShaderVector( 0, 0.01, 0, 0, 0 )
				cryptokeyBackFrame2( cryptokeyBack, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DoubleLoot",
			condition = function ( menu, element, event )
				return IsDoubleLootXP( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenDoubleXPLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

