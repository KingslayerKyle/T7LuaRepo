-- 5f955955974e5e6e822baf0f7c56df6f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.ItemGridButtom_Internal" )
require( "ui.uieditor.widgets.Border" )

CoD.ItemGridButton = InheritFrom( LUI.UIElement )
CoD.ItemGridButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ItemGridButton )
	self.id = "ItemGridButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local itemGridButtom = CoD.ItemGridButtom_Internal.new( menu, controller )
	itemGridButtom:setLeftRight( false, false, -80, 80 )
	itemGridButtom:setTopBottom( false, false, -45, 45 )
	itemGridButtom:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller )
			end
		}
	} )
	self:addElement( itemGridButtom )
	self.itemGridButtom = itemGridButtom
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( false, false, -80, 80 )
	border:setTopBottom( false, false, -45, 45 )
	border:setRGB( 1, 0.41, 0 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	self.itemGridButtom:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemGridButtom.nameLabel:setText( Engine.Localize( name ) )
		end
	end )
	self.itemGridButtom:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			itemGridButtom.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				itemGridButtom:completeAnimation()
				self.itemGridButtom:setRGB( 1, 1, 1 )
				self.itemGridButtom:setZoom( 0 )
				self.clipFinished( itemGridButtom, {} )

				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.border:setZoom( 0 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )

				itemGridButtom:completeAnimation()
				self.itemGridButtom:setZoom( 25 )
				self.clipFinished( itemGridButtom, {} )

				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				self.clipFinished( border, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )

				local itemGridButtomFrame2 = function ( itemGridButtom, event )
					if not event.interrupted then
						itemGridButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemGridButtom:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( itemGridButtom, event )
					else
						itemGridButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemGridButtom:completeAnimation()
				self.itemGridButtom:setZoom( 0 )
				itemGridButtomFrame2( itemGridButtom, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 1 )
					border:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 0 )
				borderFrame2( border, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )

				local itemGridButtomFrame2 = function ( itemGridButtom, event )
					if not event.interrupted then
						itemGridButtom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					itemGridButtom:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( itemGridButtom, event )
					else
						itemGridButtom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemGridButtom:completeAnimation()
				self.itemGridButtom:setZoom( 25 )
				itemGridButtomFrame2( itemGridButtom, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 0 )
					border:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				borderFrame2( border, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.itemGridButtom:close()
		element.border:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
