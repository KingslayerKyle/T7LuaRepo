-- 6e6b69713337b51a8c853bf0297aa6d3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Raids.RaidsPurchaseItemInternal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "restore_focus", function ( element, event )
		
	end )
end

CoD.RaidsPurchaseItem = InheritFrom( LUI.UIElement )
CoD.RaidsPurchaseItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.RaidsPurchaseItem )
	self.id = "RaidsPurchaseItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local RaidsPurchaseItemInternal0 = CoD.RaidsPurchaseItemInternal.new( menu, controller )
	RaidsPurchaseItemInternal0:setLeftRight( true, false, 0, 96 )
	RaidsPurchaseItemInternal0:setTopBottom( true, false, 0, 96 )
	RaidsPurchaseItemInternal0:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not RaidPurchaseAllowedForParent( menu, element, controller )
			end
		}
	} )
	self:addElement( RaidsPurchaseItemInternal0 )
	self.RaidsPurchaseItemInternal0 = RaidsPurchaseItemInternal0
	
	self.RaidsPurchaseItemInternal0:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			RaidsPurchaseItemInternal0.Image:setImage( RegisterImage( image ) )
		end
	end )
	self.RaidsPurchaseItemInternal0:linkToElementModel( self, "cost", true, function ( model )
		local cost = Engine.GetModelValue( model )
		if cost then
			RaidsPurchaseItemInternal0.Cost:setText( Engine.Localize( cost ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				RaidsPurchaseItemInternal0:completeAnimation()

				RaidsPurchaseItemInternal0.Highlight:completeAnimation()
				self.RaidsPurchaseItemInternal0.Highlight:setAlpha( 0 )
				self.clipFinished( RaidsPurchaseItemInternal0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				local RaidsPurchaseItemInternal0Frame2 = function ( RaidsPurchaseItemInternal0, event )
					local RaidsPurchaseItemInternal0Frame3 = function ( RaidsPurchaseItemInternal0, event )
						if not event.interrupted then
							RaidsPurchaseItemInternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							RaidsPurchaseItemInternal0.Highlight:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						end
						RaidsPurchaseItemInternal0.Highlight:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( RaidsPurchaseItemInternal0, event )
						else
							RaidsPurchaseItemInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RaidsPurchaseItemInternal0Frame3( RaidsPurchaseItemInternal0, event )
						return 
					else
						RaidsPurchaseItemInternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						RaidsPurchaseItemInternal0.Highlight:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						RaidsPurchaseItemInternal0.Highlight:setAlpha( 1 )
						RaidsPurchaseItemInternal0:registerEventHandler( "transition_complete_keyframe", RaidsPurchaseItemInternal0Frame3 )
					end
				end
				
				RaidsPurchaseItemInternal0:completeAnimation()

				RaidsPurchaseItemInternal0.Highlight:completeAnimation()
				self.RaidsPurchaseItemInternal0.Highlight:setAlpha( 0.26 )
				RaidsPurchaseItemInternal0Frame2( RaidsPurchaseItemInternal0, {} )

				self.nextClip = "Focus"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RaidsPurchaseItemInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

