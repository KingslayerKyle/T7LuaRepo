require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemAuthor" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemPublishedTime" )

local PreLoadFunc = function ( self, controller )
	local mediaManagerRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local isBuyMoreSlotModel = Engine.CreateModel( mediaManagerRootModel, "isBuyMoreSlot", false )
	local createTimeModel = Engine.CreateModel( mediaManagerRootModel, "createTime", false )
	local authorNameModel = Engine.CreateModel( mediaManagerRootModel, "authorName", false )
end

CoD.MediaManager_SelectedItemInfo = InheritFrom( LUI.UIElement )
CoD.MediaManager_SelectedItemInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MediaManager_SelectedItemInfo )
	self.id = "MediaManager_SelectedItemInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 525 )
	bg:setTopBottom( 0, 0, 0, 75 )
	bg:setRGB( 0, 0, 0 )
	bg:setAlpha( 0.8 )
	self:addElement( bg )
	self.bg = bg
	
	local FileshareSelectedItemPublishedTime = CoD.FileshareSelectedItemPublishedTime.new( menu, controller )
	FileshareSelectedItemPublishedTime:setLeftRight( 0, 0, 0, 525 )
	FileshareSelectedItemPublishedTime:setTopBottom( 0, 0, 45, 75 )
	FileshareSelectedItemPublishedTime:subscribeToGlobalModel( controller, "MediaManager", "createTime", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSelectedItemPublishedTime.PublishTime:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FileshareSelectedItemPublishedTime )
	self.FileshareSelectedItemPublishedTime = FileshareSelectedItemPublishedTime
	
	local FileshareSelectedItemAuthor = CoD.FileshareSelectedItemAuthor.new( menu, controller )
	FileshareSelectedItemAuthor:setLeftRight( 0, 0, 0, 525 )
	FileshareSelectedItemAuthor:setTopBottom( 0, 0, 0, 45 )
	FileshareSelectedItemAuthor:subscribeToGlobalModel( controller, "MediaManager", "authorName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSelectedItemAuthor.AuthorName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FileshareSelectedItemAuthor )
	self.FileshareSelectedItemAuthor = FileshareSelectedItemAuthor
	
	self.resetProperties = function ()
		FileshareSelectedItemAuthor:completeAnimation()
		FileshareSelectedItemPublishedTime:completeAnimation()
		bg:completeAnimation()
		FileshareSelectedItemAuthor:setAlpha( 1 )
		FileshareSelectedItemPublishedTime:setAlpha( 1 )
		bg:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				FileshareSelectedItemPublishedTime:completeAnimation()
				self.FileshareSelectedItemPublishedTime:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemPublishedTime, {} )
				FileshareSelectedItemAuthor:completeAnimation()
				self.FileshareSelectedItemAuthor:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemAuthor, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not MediaManagerIsBuyMoreSlot()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareSelectedItemPublishedTime:close()
		self.FileshareSelectedItemAuthor:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

