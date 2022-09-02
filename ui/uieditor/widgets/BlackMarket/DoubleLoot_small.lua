-- 41e3edec9431f5de965ccc5efb480d7b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local LoadingScreenDoubleXPLabel = CoD.LoadingScreen_DoubleXPLabel.new( menu, controller )
	LoadingScreenDoubleXPLabel:setLeftRight( false, true, -242, -38 )
	LoadingScreenDoubleXPLabel:setTopBottom( true, false, 17, 41 )
	LoadingScreenDoubleXPLabel:setAlpha( 0 )
	LoadingScreenDoubleXPLabel:setScale( 0.9 )
	LoadingScreenDoubleXPLabel.FETitleNumBrdr0:setAlpha( 0.7 )
	LoadingScreenDoubleXPLabel.XPLabel:setRGB( 1, 0.88, 0.43 )
	LoadingScreenDoubleXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLELOOT" ) )
	self:addElement( LoadingScreenDoubleXPLabel )
	self.LoadingScreenDoubleXPLabel = LoadingScreenDoubleXPLabel
	
	local cryptokeyBack = LUI.UIImage.new()
	cryptokeyBack:setLeftRight( false, true, -52, 8 )
	cryptokeyBack:setTopBottom( true, false, 0, 60 )
	cryptokeyBack:setScale( 0.75 )
	cryptokeyBack:setImage( RegisterImage( "uie_t7_icon_blackmarket_doubleloot_small" ) )
	self:addElement( cryptokeyBack )
	self.cryptokeyBack = cryptokeyBack
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LoadingScreenDoubleXPLabel:completeAnimation()
				self.LoadingScreenDoubleXPLabel:setAlpha( 0 )
				self.clipFinished( LoadingScreenDoubleXPLabel, {} )

				cryptokeyBack:completeAnimation()
				self.cryptokeyBack:setAlpha( 0 )
				self.clipFinished( cryptokeyBack, {} )
			end
		},
		DoubleLoot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LoadingScreenDoubleXPLabel:completeAnimation()
				self.LoadingScreenDoubleXPLabel:setAlpha( 0 )
				self.clipFinished( LoadingScreenDoubleXPLabel, {} )
				local cryptokeyBackFrame2 = function ( cryptokeyBack, event )
					local cryptokeyBackFrame3 = function ( cryptokeyBack, event )
						local cryptokeyBackFrame4 = function ( cryptokeyBack, event )
							if not event.interrupted then
								cryptokeyBack:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
							end
							cryptokeyBack:setAlpha( 1 )
							cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
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
				self.cryptokeyBack:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingScreenDoubleXPLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

