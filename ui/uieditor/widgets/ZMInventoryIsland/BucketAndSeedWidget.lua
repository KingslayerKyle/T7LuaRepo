-- e9e72b0c762a58bbb56a2c349e8b00ef
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMInventoryIsland.SeedWidget" )
require( "ui.uieditor.widgets.ZMInventoryIsland.BucketWidget" )

CoD.BucketAndSeedWidget = InheritFrom( LUI.UIElement )
CoD.BucketAndSeedWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BucketAndSeedWidget )
	self.id = "BucketAndSeedWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 196 )
	self:setTopBottom( true, false, 0, 232 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 17.67, 205.68 )
	bg:setTopBottom( true, false, -4, 235.28 )
	bg:setImage( RegisterImage( "uie_t7_base_quest_bucket_dlc2" ) )
	self:addElement( bg )
	self.bg = bg
	
	local SeedWidget = CoD.SeedWidget.new( menu, controller )
	SeedWidget:setLeftRight( true, false, 117.39, 181.39 )
	SeedWidget:setTopBottom( true, false, 53.27, 117.27 )
	SeedWidget:setScale( 0.8 )
	self:addElement( SeedWidget )
	self.SeedWidget = SeedWidget
	
	local BucketWidget0 = CoD.BucketWidget.new( menu, controller )
	BucketWidget0:setLeftRight( true, false, 0, 196 )
	BucketWidget0:setTopBottom( true, false, 0, 232 )
	BucketWidget0:setScale( 0.5 )
	self:addElement( BucketWidget0 )
	self.BucketWidget0 = BucketWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				SeedWidget:completeAnimation()
				self.SeedWidget:setAlpha( 0 )
				self.clipFinished( SeedWidget, {} )

				BucketWidget0:completeAnimation()
				self.BucketWidget0:setAlpha( 0 )
				self.clipFinished( BucketWidget0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				SeedWidget:completeAnimation()
				self.SeedWidget:setAlpha( 1 )
				self.clipFinished( SeedWidget, {} )

				BucketWidget0:completeAnimation()
				self.BucketWidget0:setAlpha( 1 )
				self.clipFinished( BucketWidget0, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							if not event.interrupted then
								bg:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							end
							bg:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( bg, event )
							else
								bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bgFrame4( bg, event )
							return 
						else
							bg:beginAnimation( "keyframe", 2680, false, false, CoD.TweenType.Linear )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						bg:setAlpha( 1 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )

				SeedWidget:completeAnimation()
				self.SeedWidget:setAlpha( 1 )
				self.clipFinished( SeedWidget, {} )

				BucketWidget0:completeAnimation()
				self.BucketWidget0:setAlpha( 1 )
				self.clipFinished( BucketWidget0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SeedWidget:close()
		element.BucketWidget0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

