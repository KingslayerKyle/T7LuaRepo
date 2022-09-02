-- 910753316caa368e7ff9a56ecd525d39
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemPublishedTime" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemAuthor" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local f1_local1 = Engine.CreateModel( f1_local0, "isBuyMoreSlot", false )
	local f1_local2 = Engine.CreateModel( f1_local0, "createTime", false )
	local f1_local3 = Engine.CreateModel( f1_local0, "authorName", false )
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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 50 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 350 )
	bg:setTopBottom( true, false, 0, 50 )
	bg:setRGB( 0, 0, 0 )
	bg:setAlpha( 0.8 )
	self:addElement( bg )
	self.bg = bg
	
	local FileshareSelectedItemPublishedTime = CoD.FileshareSelectedItemPublishedTime.new( menu, controller )
	FileshareSelectedItemPublishedTime:setLeftRight( true, false, 0, 350 )
	FileshareSelectedItemPublishedTime:setTopBottom( true, false, 30, 50 )
	FileshareSelectedItemPublishedTime:subscribeToGlobalModel( controller, "MediaManager", "createTime", function ( model )
		local createTime = Engine.GetModelValue( model )
		if createTime then
			FileshareSelectedItemPublishedTime.PublishTime:setText( Engine.Localize( createTime ) )
		end
	end )
	self:addElement( FileshareSelectedItemPublishedTime )
	self.FileshareSelectedItemPublishedTime = FileshareSelectedItemPublishedTime
	
	local FileshareSelectedItemAuthor = CoD.FileshareSelectedItemAuthor.new( menu, controller )
	FileshareSelectedItemAuthor:setLeftRight( true, false, 0, 350 )
	FileshareSelectedItemAuthor:setTopBottom( true, false, 0, 30 )
	FileshareSelectedItemAuthor:subscribeToGlobalModel( controller, "MediaManager", "authorName", function ( model )
		local authorName = Engine.GetModelValue( model )
		if authorName then
			FileshareSelectedItemAuthor.AuthorName:setText( authorName )
		end
	end )
	self:addElement( FileshareSelectedItemAuthor )
	self.FileshareSelectedItemAuthor = FileshareSelectedItemAuthor
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )

				bg:completeAnimation()
				self.bg:setAlpha( 0.8 )
				self.clipFinished( bg, {} )

				FileshareSelectedItemPublishedTime:completeAnimation()
				self.FileshareSelectedItemPublishedTime:setAlpha( 1 )
				self.clipFinished( FileshareSelectedItemPublishedTime, {} )

				FileshareSelectedItemAuthor:completeAnimation()
				self.FileshareSelectedItemAuthor:setAlpha( 1 )
				self.clipFinished( FileshareSelectedItemAuthor, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSelectedItemPublishedTime:close()
		element.FileshareSelectedItemAuthor:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

